import 'package:akar/models/propertyKindModel.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyKindController extends GetxController {
  //final areaID=Get.arguments['areaID']?.toString().obs!=null?Get.arguments['areaID']?.toString().obs:'RsCIGoD7d9CaZDQs6Hhy' ;
  // final areaID='RsCIGoD7d9CaZDQs6Hhy' ;


  RxList get PropertyKindModelList =>
      _PropertyKindModelList;
  RxList<dynamic> _PropertyKindModelList = [].obs  ;
  PropertyKindController() {
  getPropertyKind();


  }

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('propertyKind');

  void getPropertyKind() async {

    await _collectionReference.get().then((value) {
      for (int i = 0; i < value.docs.length; i++)
      {
        String id=value.docs[i].id;
        Map<dynamic,dynamic>data=value.docs[i].data() as Map;
        PropertyKindModelll finalData=PropertyKindModelll.fromJson(data);
        finalData.id=id;
        _PropertyKindModelList.add(finalData);
        update();

      }

    });
  }
}
