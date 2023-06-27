import 'package:akar/views/LoginScreen/LoginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import '../models/user_model.dart';
import '../views/homeScreen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthhController extends GetxController {
  RxList<Userr> _UserModel = <Userr>[].obs;
  RxList<Userr> get UserModel => _UserModel;
  late String email, password;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FacebookLogin _facebookLogin = FacebookLogin();
  FirebaseAuth _Auth = FirebaseAuth.instance;
  RxString UserPhone = ''.obs;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('UserData');

  //sign in with gmail acoount
  void googlesigninmethod(String phone) async {
    final GoogleSignInAccount? googleUserAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUserAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await _Auth.signInWithCredential(credential);
    await saveUser(googleUserAccount, phone)
        .then((value) =>
    
        Get.to(homescreen()));
  }

  //save user data
  Future<void> saveUser(GoogleSignInAccount account, String myPhone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    FirebaseFirestore.instance.collection('UserData').doc(account.id).set({
      'email': account.email,
      'name': account.displayName,
      'image': account.photoUrl,
      'id': account.id,
      'phone': myPhone
    }).then((value) => prefs.setString('userID', account.id));
    
  }

// sign in with Facebook Account

  void facebookSigninMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(permissions: []);
    final accessToken = result.accessToken!.token;
    if (result.status == FacebookLoginStatus.success) {
      final FaceCredential = FacebookAuthProvider.credential(accessToken);
      await _Auth.signInWithCredential(FaceCredential)
          .then((value) => Get.to(homescreen()));
    }
  }

  // sign in with email and password
  void EmailSigninMethod() {
    try {
      _Auth.signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.to(homescreen()));
    } catch (e) {
      Get.snackbar('Login Error', '',
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void getUserData() async {
    final QuerySnapshot snapshot = await userCollection.where('id',isEqualTo: '108314246304526770520').get();
    final List<QueryDocumentSnapshot> documents = snapshot.docs;

    for (int i = 0; i < documents.length; i++) {
      Map<dynamic, dynamic> data = documents[i].data() as Map;
      Userr finalData=Userr.fromJson(data);
      _UserModel.add(finalData);

    }

  }


  void LogOut()async{await _Auth.signOut().then((value) => Get.to(()=>LoginScreen()));}
}
