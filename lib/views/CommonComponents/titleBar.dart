import 'package:flutter/material.dart';
import '../../config/constants.dart';

class TitleBar extends StatelessWidget {
  TitleBar(this.teext1, this.teext2);
  final String teext1;
  final String teext2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(teext1),
          Text(
          teext2,
            style: TextStyle(fontSize: 35,color: Constants.MainColor),
          )
        ],
      ),
    );
  }
}
