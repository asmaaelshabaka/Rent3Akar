import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../propertyDetailScreen/propertyDetailScreen.dart';
import '../../propertyListScreen/propertyListScreen.dart';

class KindPropertyBoxGrid extends StatelessWidget {
  KindPropertyBoxGrid(this.PropertyKind, this.icon, this.ontab);
  String PropertyKind;
  String icon;
  final VoidCallback ontab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
          onTap: ontab,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(24)),
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  icon,
                  height: 65,
                ),
                Row(
                  children: [Text(PropertyKind)],
                )
              ],
            ),
          )),
    );
  }
}
