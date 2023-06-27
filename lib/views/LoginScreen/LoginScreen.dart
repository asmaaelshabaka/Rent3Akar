import 'package:akar/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/constants.dart';
import '../../controllers/authController.dart';
import '../CommonComponents/CustomButton.dart';
import '../CommonComponents/SquareTile.dart';
import '../CommonComponents/TextFieldCommon.dart';
import '../homeScreen/homeScreen.dart';
import '../signUpScreen/signUpScreen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class LoginScreen extends GetWidget<AuthhController> {
  final UserNameController = TextEditingController();
  final PasswordController = TextEditingController();
  final phonetextController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final ScreenSize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: ScreenSize.height*.05,
                ),
                //loggo
                Icon(
                  Icons.lock,
                  size: 100,
                ),

                //Welcome Back

                Padding(
                  padding: EdgeInsets.all(25),
                  child: Text(
                    'Welcome to Rent 3akar!\n\nAt Rent 3akar, we make finding your dream property to rent a breeze. Whether you\'re looking for an apartment, house, or commercial space, our app provides an extensive collection of listings to suit your needs.\n\n Get started by logging in and begin your journey to finding the ideal place to call home!',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: ScreenSize.height*.1,
                ),

                //OR CONTINUE WITH

                Column(
                  children: [
                    CustomButtom(() {
                      AwesomeDialog(
                              context: context,
                              body: Center(
                                child: Column(
                                  children: [
                                    Text('Add Your Contant Phone Please.......'),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFieldCommon(
                                        phonetextController, 'Phone', false,
                                        (value) {
                                      controller.UserPhone =
                                          value.toString() as RxString;
                                    }, (S) {
                                      if (S == null || S.isEmpty) {
                                        return 'Enter Your Address PLeaseeeeeee';
                                      }
                                      return '';
                                    })
                                  ],
                                ),
                              ),
                              showCloseIcon: true,
                              btnOkOnPress: () {
                                print(phonetextController.text);
                              },
                              dialogType: DialogType.info)
                          .show()
                          .then((value) => controller
                              .googlesigninmethod(phonetextController.text));

                      // Get.to(homescreen());
                    }, 'Google  LogIn ', CircleAvatar(backgroundImage: AssetImage('assets/icons/google.png',),backgroundColor: Colors.black,)),
                    SizedBox(height: ScreenSize.height*.02,),
                    CustomButtom(() {
                      AwesomeDialog(
                          context: context,
                          body: Center(
                            child: Column(
                              children: [
                                Text('Add Your Contant Phone Please.......'),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFieldCommon(
                                    phonetextController, 'Phone', false,
                                        (value) {
                                      controller.UserPhone =
                                      value.toString() as RxString;
                                    }, (S) {
                                  if (S == null || S.isEmpty) {
                                    return 'Enter Your Address PLeaseeeeeee';
                                  }
                                  return '';
                                })
                              ],
                            ),
                          ),
                          showCloseIcon: true,
                          btnOkOnPress: () {
                            print(phonetextController.text);
                          },
                          dialogType: DialogType.info)
                          .show()
                          .then((value) => controller
                          .facebookSigninMethod());

                      // Get.to(homescreen());
                    }, 'FaceBook  LogIn ', CircleAvatar(backgroundImage: AssetImage('assets/icons/facebook.png'),)),
                  ],
                ),

                //----another

                //NOT AMEMBER ---cREATE ONE
              ],
            ),
          ),
        ),
      ),
    );
  }
}
