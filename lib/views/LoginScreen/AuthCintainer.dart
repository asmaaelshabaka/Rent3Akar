import 'package:flutter/material.dart';

import '../homeScreen/homeScreen.dart';
import 'LoginScreen.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggin=true;
    if (isLoggin==true)
      return homescreen();
    else return LoginScreen();

  }
}
