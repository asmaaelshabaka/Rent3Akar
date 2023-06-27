import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../controllers/PropertyController.dart';
import '../../controllers/videoController.dart';
import '../CommonComponents/drawerTab.dart';
import '../CommonComponents/appBarr.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';

import 'components/PropertyTableDetails.dart';

class PropertyDetailScreen extends StatelessWidget {
  PropertyController propertyController = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;

    return Scaffold(drawer: DrawerTab(),
      backgroundColor: Colors.white,
      body:
         SafeArea(
          child: Column(
            children: [
              //--Custom App Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.HorizontalPadding,
                    vertical: Constants.VerticalPadding),
                child: AppBarr(),
              ),
              SizedBox(
                height: 5,
              ),
              // Welcome Home Text 3akar
              Text(
                'Rent At ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(propertyController.mypropertyModel.value.address),
              //---video of property
              Container(
                decoration: BoxDecoration(border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 350,
                height: 250,
                child: GetBuilder<VideoController>(
                    init: VideoController(propertyController.mypropertyModel.value.VideoURL.toString()),
                    builder: (controller) => Expanded(
                        child: Center(
                            child: controller.chewieController != null &&
                                    controller.chewieController!
                                        .videoPlayerController.value.isInitialized
                                ? Container(
                                    width: Size.width,
                                    height: Size.height / 3,
                                    child: Chewie(
                                        controller: controller.chewieController!),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('loading.......')
                                    ],
                                  )))),
              ),
              SizedBox(height: 40,),
              //----the Detials of property writes
              PropertyTableDetails(),
              SizedBox(height: 50,),

              // Container(child: GridView.count(crossAxisCount: 2,padding: EdgeInsets.all(16),children: [Text('data'),Text('data')],)),

              //-----the seller contact info
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    color: Constants.MainColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/fossa.png'),
                      ),
                      Text('ASMAA EL SHABAKA'),
                      Icon(Icons.phone)
                    ],
                  ),
                ),
              )

              //---VideoPlayer For The Property
            ],
          ),
        ),

    );
  }
}
