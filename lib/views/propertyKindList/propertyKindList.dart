import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../controllers/PropertyController.dart';
import '../../controllers/propertyKindController.dart';
import '../CommonComponents/appBarr.dart';
import '../CommonComponents/drawerTab.dart';
import '../CommonComponents/titleBar.dart';
import '../homeScreen/components/homeBoxGrid.dart';
import '../propertyListScreen/propertyListScreen.dart';
import 'components/KindPropertyBoxGrid.dart';
import 'package:get/get.dart';

class PropertyKindList extends StatelessWidget {
  PropertyKindController proKindController = Get.put(PropertyKindController());
  PropertyController propertyController = Get.put(PropertyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTab(),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Custom App Bar
            Padding(
                padding: EdgeInsets.all(10),
                child: AppBarr()),
            SizedBox(
              height: 20,
            ),
            TitleBar('Choose Your', ' Property'),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Obx((){return GridView.builder(
                    itemCount: proKindController.PropertyKindModelList.length,
                    padding: EdgeInsets.all(20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1 / 1.30),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  KindPropertyBoxGrid(
                              proKindController
                                  .PropertyKindModelList[index].Name,
                              proKindController
                                  .PropertyKindModelList[index].Image, () {
                                String areaID=Get.arguments['areaID'].toString();

//-------------------------------------------------------
                            propertyController.GetPropety(areaID,proKindController.PropertyKindModelList[index].id );

                            Get.to(() => PropertyListScreen(),
                                arguments: {
                                  'iddd': proKindController
                                      .PropertyKindModelList[index].id==null?'7H8LXHuI2dIaSGWhBaWb':proKindController.PropertyKindModelList[index].id,
                                  'area':areaID
                                }
                            );
                          })
                      );
                    });})

            )
          ],
        ),
      ),
    );
  }
}
