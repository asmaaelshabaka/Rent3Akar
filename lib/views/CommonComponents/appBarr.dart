import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/userController.dart';
import '../userProfileScreen/userProfileScreen.dart';

class AppBarr extends StatelessWidget {
  UserController userController = UserController();
  @override
  Widget build(BuildContext context) {
    final userModel = userController.UserModel.value;

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Menue Icon
          Flexible(fit: FlexFit.loose,
            child: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset(
                'assets/icons/menu.png',
                height: 30,
                color: Colors.grey[800],
              ),
            ),
          ),
          Flexible(fit: FlexFit.loose,
            child: GestureDetector(
                onTap: () {
                  Get.to(UserProfileScreen());
                },
                // child: Obx(()=>Image.network(userController.UserModel.value[0].image,width: 50,height: 50,),),)
                child: Obx(() =>

                userController.userModell==null?
                SizedBox()
                    :    CircleAvatar(

                  backgroundImage:
                  NetworkImage(userController.userModell.value.image),)),
          ))

          //Account Icon
          // Image.asset(
          //   'assets/icons/user.png',
          //   height: 40,
          //   color: Colors.grey[800],
          // )
        ],
      ),
    );
  }
}
