import 'package:flutter/material.dart';

class SquaredTile extends StatelessWidget {
  SquaredTile(this.imagePath);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white),color: Colors.grey[200]),
      child: Image.asset(imagePath),
      height: 40,
    );
  }
}
