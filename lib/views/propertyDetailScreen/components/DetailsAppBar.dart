import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/PropertyController.dart';

class DetailsAppBar extends StatelessWidget {
  PropertyController propertyController = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(onTap: (){Get.back();},
          child: Image.asset(
            'assets/icons/back.png',
            height: 40,

          ),
        ),
        Text(propertyController.mypropertyModel.value.RentCost),
        CircleAvatar(backgroundColor: Colors.grey[500],
          radius: 20,

          backgroundImage: AssetImage('assets/images/sasa.jpeg'),
        ),
      ],
    );
  }
}
