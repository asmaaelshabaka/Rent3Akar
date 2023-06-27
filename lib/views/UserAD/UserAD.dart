import 'dart:ffi';

import 'package:akar/controllers/PropertyController.dart';
import 'package:akar/models/property_model.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../controllers/areaController.dart';
import '../../controllers/propertyKindController.dart';
import '../CommonComponents/CustomButton.dart';
import '../CommonComponents/TextFieldCommon.dart';
import '../CommonComponents/appBarr.dart';
import '../CommonComponents/drawerTab.dart';
import '../CommonComponents/titleBar.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:typed_data';

import '../homeScreen/homeScreen.dart';

class UserAD extends StatelessWidget {
  PropertyController propertyController = Get.put(PropertyController());
  AreaController areaController = Get.put(AreaController());



  final AVDateContoller = TextEditingController();
  final addressTextController = TextEditingController();
  final rentTextController = TextEditingController();
  final ratetextController = TextEditingController();
  RxString SelectedLocation = ''.obs;
  RxString SelectedProperty = ''.obs;

  PropertyKindController kindController = Get.put(PropertyKindController());

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> FormKey = new GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: DrawerTab(),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //--appbar
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Constants.HorizontalPadding,
                      vertical: Constants.VerticalPadding),
                  child: AppBarr()),

              TitleBar('Add Your', 'Rent AD'),

              SizedBox(
                height: 20,
              ),

              Form(
                  key: FormKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Choose The Location'),
                              Obx(() => DropdownButton<String>(
                                  value: SelectedLocation == ''
                                      ? areaController.AreaModelList[0].id
                                      : SelectedLocation.value.toString(),
                                  items: areaController.AreaModelList.map(
                                      (element) {
                                    return DropdownMenuItem<String>(
                                      value: element.id,
                                      child: Text(element.Name),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    SelectedLocation.value = (value.toString());
                                  }))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Choose Kind Of Property'),
                              Obx(() => DropdownButton<String>(
                                  value: SelectedProperty == ''
                                      ? kindController
                                          .PropertyKindModelList[0].id
                                      : SelectedProperty.value.toString(),
                                  items:
                                      kindController.PropertyKindModelList.map(
                                          (element) {
                                    return DropdownMenuItem<String>(
                                        value: element.id,
                                        child: Text(element.Name));
                                  }).toList(),
                                  onChanged: (value) {
                                    SelectedProperty.value = (value.toString());
                                  }))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldCommon(
                          addressTextController, 'Address', false, (value) {},
                          (S) {
                        if (S == null || S.isEmpty) {
                          return 'Enter Your Address PLeaseeeeeee';
                        }
                        return '';
                      }),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldCommon(rentTextController, 'Rent Per Month',
                          false, (value) {}, (S) {
                        return '';
                      }),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldCommon(ratetextController, 'Increase Rate',
                          false, (value) {}, (S) {
                        return '';
                      }),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Constants.HorizontalPadding),
                        child: TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                              filled: true,
                              hintText:
                                  'Add more Information for your   Unit Like How Many Rooms ',
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              fillColor: Colors.grey.shade200,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  try {
                                    await propertyController
                                        .addOneVideo()
                                        .toString();
                                    AwesomeDialog(
                                      body: Center(
                                        child: Obx(() {
                                          return Column(
                                            children: [
                                              Text(
                                                  '${(propertyController.uploadingprogress.value * 100).toStringAsFixed(0)}%'),
                                              LinearProgressIndicator(
                                                color: Colors.red,
                                                value: propertyController
                                                    .uploadingprogress.value,
                                              )
                                            ],
                                          );
                                        }),
                                      ),
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.topSlide,
                                      showCloseIcon: true,
                                      title: 'Upload',
                                      desc: ' Upload Video Is Done',
                                    ).show();
                                  } catch (e) {}
                                },
                                child: Row(
                                  children: [
                                    Text('One Video'),
                                    Column(
                                      children: [
                                        Icon(Icons.video_library_rounded),
                                      ],
                                    )
                                  ],
                                )),
                            GestureDetector(
                              onTap: () async {
                                try {
                                  await propertyController
                                      .addOneImage()
                                      .toString();
                                  AwesomeDialog(
                                    body: Center(
                                      child: Column(
                                        children: [
                                          Text('Upload Image Is Done')
                                        ],
                                      ),
                                    ),
                                    context: context,
                                    dialogType: DialogType.success,
                                    animType: AnimType.topSlide,
                                    showCloseIcon: true,
                                    title: 'Upload',
                                    desc: ' Upload Image Is Done',
                                    enableEnterKey: true,
                                  ).show();
                                } catch (e) {}
                                ;
                              },
                              child: Row(
                                children: [
                                  Text('One Photo'),
                                  Icon(Icons.add_a_photo),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomButtom(() {
                        Propertymodel newADD = Propertymodel(
                            address: addressTextController.text,
                            RentCost: rentTextController.text,
                            IDarea: SelectedLocation.value.toString().trim(),
                            IDKindProperty:
                                SelectedProperty.value.toString().trim(),
                            imageUrl:
                                propertyController.imageUrl!.value.toString(),
                            VideoURL:
                                propertyController.videoUrl!.value.toString(),
                            Space: '500 METER',
                            ownerID: '1',userID: '108314246304526770520');
                        try {
                          propertyController.addNewPropertyAD(newADD);
                          AwesomeDialog(
                            body: Center(
                              child: Column(
                                children: [Text('Done')],
                              ),
                            ),
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.topSlide,
                            showCloseIcon: true,
                            title: 'done',
                            desc: '  Done',
                          ).show().then((value) => Get.to(homescreen()));
                        } catch (e) {
                          AwesomeDialog(
                            body: Center(
                              child: Column(
                                children: [Text('not Done there is an error')],
                              ),
                            ),
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.topSlide,
                            showCloseIcon: true,
                            title: 'error',
                            desc: ' error',
                          ).show();
                        }
                      }, 'Add Your Rent AD',CircleAvatar())
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
