import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/authController.dart';
import '../../controllers/userController.dart';
import 'components/UserInfoCard.dart';

class UserProfileScreen extends StatelessWidget {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            Obx(() => Image.network(userController.userModell.value.image.toString()),),
            Obx(() => Text(
              userController.userModell.value.name.toString(),
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Pacifico-Regular',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                thickness: 2,
                color: Colors.white,
              ),
            ),
                Obx(() => UserInfoCard(userController.userModell.value.phone,Icons.phone)),
                 Obx(() => UserInfoCard(userController.userModell.value.email,Icons.email)),
            //  UserInfoCard(authController.UserModel[0].,Icons.location_on)
          ],
        ),
      ),
    );
  }
}
