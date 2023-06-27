import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  RxList<Userr> _UserModel = <Userr>[].obs;
  RxList<Userr> get UserModel => _UserModel;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('UserData');
  Rx<Userr> userModell =
      Userr(email: '', id: '', image: '', name: '', phone: '').obs;

  UserController() {
    if (_UserModel != null) {
      GetUserData();
    }
  }
  GetUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? useridd= prefs.getString('userID');
    final QuerySnapshot snapshot =
        await userCollection.where('id', isEqualTo: useridd).get();

    if (snapshot.docs.isNotEmpty) {
      Map<dynamic, dynamic> UserData = snapshot.docs.first.data() as Map;
      userModell.value=Userr.fromJson(UserData);
    }

    // final List<QueryDocumentSnapshot> documents = snapshot.docs;
    //
    // for (int i = 0; i < documents.length; i++) {
    //   Map<dynamic, dynamic> data = documents[i].data() as Map;
    //   Userr finalData = Userr.fromJson(data);
    //   _UserModel.add(finalData);
    // }
    // print(_UserModel.value.first.email.toString() +
    //     'mariooooooooooooooosasasasa');
  }
}
