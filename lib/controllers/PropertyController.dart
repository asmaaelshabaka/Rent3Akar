import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/property_model.dart';

class PropertyController extends GetxController {
 late final PropertyKindID = Get.arguments?['iddd'];
 late  final  areaID = Get.arguments?['area'];
  late final PropertyOneArgumnet = Get.arguments?['idProperty'].toString().obs;
  Rx<Propertymodel> mypropertyModel = Propertymodel(address: 'address', RentCost: 'RentCost', IDarea: 'IDarea', IDKindProperty: 'IDKindProperty', imageUrl: 'imageUrl', VideoURL: 'VideoURL', Space: 'Space',ownerID:'ownerID',userID: '').obs;
  late File? videoFile;
  RxBool uploading = false.obs;
  var uploadingprogress = 0.0.obs;
  RxString? imageUrl = 'طظ'.obs;
  RxString? videoUrl = 'طظييين'.obs;

  PropertyController() {
    print('MOMOMOMOMOMO I LOVE YOU: ${Get.arguments}');
    if(PropertyKindID!=null && areaID!=null ) {
     //GetPropety();
    }
    else{ }
  }
  RxList<Propertymodel> _PropertyList = <Propertymodel>[].obs;
  RxList<Propertymodel> get PropertyList => _PropertyList;
  Rx<Rxn<Propertymodel>> Propertyvar = Rxn<Propertymodel>().obs;
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Property');

  //----get property based on area id and property kind ID
  GetPropety(String areaid, String KindId) async {
    await _collectionReference
        .where('IDKindProperty', isEqualTo: KindId)
        .where('IDarea', isEqualTo: areaid)
        .get()
        .then((value) {

      for (int i = 0; i < value.docs.length; i++) {
        String id = value.docs[i].id;
        Map<dynamic, dynamic> data = value.docs[i].data() as Map;
        Propertymodel finalData = Propertymodel.fromJson(data);
        finalData.id = id;
        _PropertyList.add(finalData);
      }
    });
  }

  GetOneProperty(String id) {
    try {
      for (Propertymodel property in PropertyList) {
        if (property.id == id.trim()) {
           mypropertyModel.value = Propertymodel(
              address: property.address,
              RentCost: property.RentCost,
              IDarea: property.IDarea,
              IDKindProperty: property.IDKindProperty,
              imageUrl: property.imageUrl,
              VideoURL: property.VideoURL,
              Space: property.Space,ownerID:property.ownerID,userID: '108314246304526770520');
        } else {
          print('sooooooory');
        }
        ;
      }
    } catch (e) {
      print(e.toString() + 'wheeeeeeeeeeeeeeeeeeeere');
    }
  }

  addNewPropertyAD(Propertymodel propertyModel) async {
    try {
      _collectionReference.add({
        'IDKindProperty': propertyModel.IDKindProperty,
        'IDarea': propertyModel.IDarea,
        'IncreaseRate': propertyModel.IncreaseRate,
        'Location': propertyModel.Location,
        'MoreData': propertyModel.MoreData,
        'RentCost': propertyModel.RentCost,
        'Space': propertyModel.Space,
        'VideoURL': propertyModel.VideoURL,
        'address': propertyModel.address,
        'imageUrl': propertyModel.imageUrl
      });
    } catch (e) {}
  }

  addOneImage() async {
    //1- pick image
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) return '';

    String uniqeNameImage = DateTime.now().microsecondsSinceEpoch.toString();

    //2-upload to firestore

    Reference refrenceRoot = FirebaseStorage.instance.ref();
    Reference refrenceImage = refrenceRoot.child('images');
    Reference RefImagToUpload = refrenceImage.child(uniqeNameImage);

    //3-Get URL
    try {
      await RefImagToUpload.putFile(File(file.path.toString()));
    } catch (error) {}

    //return URL
    imageUrl!.value = await RefImagToUpload.getDownloadURL() as String;
    print(imageUrl!.value.toString() + 'marouuusa is sharm');
  }

  addOneVideo() async {
    // Select Video File
    final pickVideo = ImagePicker();
    final pickedFile = await pickVideo.getVideo(source: ImageSource.gallery);
//if(pickedFile==null)return;
    final file = File(pickedFile!.path);
    final FirebaseStorage storage = FirebaseStorage.instance;
    final Reference storageRef = storage
        .ref()
        .child('videos/${DateTime.now().microsecondsSinceEpoch}.mp4');
    final UploadTask uploadTask = storageRef.putFile(
        file,
        SettableMetadata(
            contentType: 'video/mp4', customMetadata: {'uploaded_by': 'user'}));

    uploading.value = true;
    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      final progress = snapshot.bytesTransferred / snapshot.totalBytes;
      uploadingprogress.value = progress;
    }, onDone: () {
      uploading.value = false;
      uploadingprogress.value = 0.0 / 100;
    });

    final TaskSnapshot taskSnapshot = await uploadTask;
    final String VideoUrl = await taskSnapshot.ref.getDownloadURL();

    videoUrl!.value = VideoUrl as String;
    print(videoUrl!.toString() + 'marouuusa is sharrrrroma');
  }
}
