import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/constants.dart';

import '../CommonComponents/CustomButton.dart';
import '../CommonComponents/SquareTile.dart';
import '../CommonComponents/TextFieldCommon.dart';
import '../LoginScreen/LoginScreen.dart';
import '../homeScreen/homeScreen.dart';
import '../signUpScreen/signUpScreen.dart';

class SignUpScreen extends StatelessWidget {
  final EmailController = TextEditingController();
  final UserNameController = TextEditingController();
  final PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                //loggo
                Icon(
                  Icons.lock,
                  size: 100,
                ),

                //Welcome Back
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Welcome To 3Akar',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFieldCommon(EmailController, 'Email', false,(value){},(S){return '';}),

                //USER NAME TEXT BOB
                SizedBox(
                  height: 25,
                ),
                TextFieldCommon(UserNameController, 'Password', false,(value){},(S){return '';}),

                // PASSWORD TEXT BOX
                SizedBox(
                  height: 25,
                ),
                TextFieldCommon(PasswordController, 'Confirm Password', true,(value){},(S){return '';}),

                //SIGN IN BUTTON
                SizedBox(
                  height: 10,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       // Text(
                //       //   'Forget Password ?',
                //       //   style: TextStyle(color: Colors.grey[600]),
                //       // ),
                //     ],
                //   ),
                // ),

                //OR CONTINUE WITH
                SizedBox(
                  height: 25,
                ),
                CustomButtom(() {
                  Get.to(homescreen());
                }, 'SignUp',CircleAvatar()),

                //GOOGLE + APPLE
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: .5,
                        color: Colors.grey[400],
                      )),
                      Text(
                        'Or Continue',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: .5,
                        color: Colors.grey[400],
                      ))
                    ],
                  ),
                ),
                //----another
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //--google
                    SquaredTile('assets/icons/google.png'),
                    SizedBox(
                      width: 25,
                    ),
                    //--apple
                    SquaredTile('assets/icons/apple.png'),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Have Account'),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                        child: Text(
                          'Login Now',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ))
                  ],
                )

                //NOT AMEMBER ---cREATE ONE
              ],
            ),
          ),
        ),
      ),
    );
  }
}
