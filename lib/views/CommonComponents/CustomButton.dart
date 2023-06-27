import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom(this.onTap, this.title,this.image);
  final Function()? onTap;
  final String title;
  final CircleAvatar image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Row(
            children: [
            //  Icon(icondata,color: Colors.white,),
              image,
              SizedBox(width: 50),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
