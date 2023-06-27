import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  UserInfoCard(this.text, this.icon);
  final String text;
  final IconData icon;
//  function Onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(
            text,
            style: TextStyle(color: Colors.red[900],fontSize: 15),
          ),
        ),
      ),
    );
  }
}
