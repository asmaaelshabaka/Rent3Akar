import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/areamodel.dart';

class AreaController extends GetxController {


  RxList<AreaModel> _AreaModelList = <AreaModel>[].obs ;
  RxList<AreaModel> get AreaModelList => _AreaModelList;

  AreaController() {
    GetAreas();

  }
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Area');
  //getArea
  void GetAreas() async {
    final QuerySnapshot snapshot=await _collectionReference.get();
    final List<QueryDocumentSnapshot> documents = snapshot.docs;

      for (int i = 0; i < documents.length; i++) {
        String id = documents[i].id;
        Map<dynamic, dynamic> data = documents[i].data() as Map;
        AreaModel finalData = AreaModel.fromJson(data);
        finalData.id=id;
       // print(finalData.id.toString());
        _AreaModelList.add(finalData);

      }



  }
}
