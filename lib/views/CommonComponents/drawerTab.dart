import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/authController.dart';
import '../LoginScreen/LoginScreen.dart';
import '../UserAD/UserAD.dart';
import '../homeScreen/homeScreen.dart';
import '../settingsScreen/settingsScreen.dart';
import '../userProfileScreen/userProfileScreen.dart';

class DrawerTab extends StatelessWidget {
  AuthhController AuthController = Get.put(AuthhController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              DrawerHeader(
                  child: Center(
                child: Text(
                  'L O G O ',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              )),
              ListTile(
                onTap: () {Get.to(()=>homescreen());},
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {Get.to(()=>UserAD());},
                leading: Icon(
                  Icons.add_box,
                  color: Colors.white,
                ),
                title: Text(
                  'Add Your Rent Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  AuthController.getUserData();
                  Get.to(()=>UserProfileScreen());
                  },
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  'My Profile',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {Get.to(()=>settingsScreen());},
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: ()
                {
                  //---call log out function
                  AuthController.LogOut();


                },
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
