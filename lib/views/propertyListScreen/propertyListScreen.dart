import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/constants.dart';
import '../../controllers/PropertyController.dart';
import '../CommonComponents/appBarr.dart';
import '../CommonComponents/drawerTab.dart';
import '../CommonComponents/titleBar.dart';
import '../propertyDetailScreen/propertyDetailScreen.dart';
import 'components/FilterBar.dart';
import 'components/PropertyBoxDetails.dart';

class PropertyListScreen extends StatelessWidget {
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
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.HorizontalPadding,
                  vertical: Constants.VerticalPadding),
              //-----app bar------
              child: AppBarr(),
            ),
            SizedBox(
              height: 5,
            ),
            TitleBar('Choose Your', 'Property'),
            /////Filter Bar-------
            // FilterBar(),
            SizedBox(
              height: 20,
            ),

            //-------List Of Properties------//
            Expanded(child: Obx(() {
              return GridView.builder(
                  itemCount: propertyController.PropertyList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 1 / 1),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        propertyController.GetOneProperty(propertyController.PropertyList[index].id.toString());
                        Get.to(PropertyDetailScreen(), arguments: {
                          'idProperty':
                              propertyController.PropertyList[index].id
                        });
                      },
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        color: Colors.black,
                        elevation: 10,
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.network(
                                  propertyController
                                      .PropertyList[index].imageUrl,
                                  fit: BoxFit.cover,
                                  width: 300,
                                  height: 250,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Avilable Date',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      '13/05/2023',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Rent Cost Per Month',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      propertyController
                                              .PropertyList[index].RentCost +
                                          ' EGP',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                    );
                    //   Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: PropertyBoxDetails()
                    // );
                  });
            })),
          ],
        ),
      ),
    );
  }
}
