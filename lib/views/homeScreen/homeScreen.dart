import 'package:akar/controllers/areaController.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../controllers/propertyKindController.dart';
import '../CommonComponents/appBarr.dart';
import '../CommonComponents/drawerTab.dart';
import '../CommonComponents/titleBar.dart';
import '../propertyKindList/propertyKindList.dart';
import 'components/homeBoxGrid.dart';
import 'package:get/get.dart';

class homescreen extends StatelessWidget {
  AreaController areaController = Get.put(AreaController());
  //PropertyKindController proKindController = Get.put(PropertyKindController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerTab(),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Custom App Par

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.HorizontalPadding,
                    vertical: Constants.VerticalPadding),
                child:  AppBarr(),
              ),


              //Welcome Home Text 3akar
              TitleBar('Welcome To', ' 3Akar Giza'),
              const SizedBox(
                height: 20,
              ),

              Expanded(
                  child: Obx((){return GridView.builder(
                      itemCount: areaController.AreaModelList.length,
                      padding: const EdgeInsets.all(25),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HomeBoxGrid(
                                  areaController.AreaModelList[index].Name,
                                  areaController.AreaModelList[index].Image,
                                      () {
                                        //-----------------------------------------------

                                      //  proKindController.getPropertyKind();
                                    Get.to(()=>PropertyKindList(), arguments: {
                                      'areaID': areaController.AreaModelList[index].id
                                    });
                                  })
                           );
                      });}))
            ],
          ),
        ));
  }
}
