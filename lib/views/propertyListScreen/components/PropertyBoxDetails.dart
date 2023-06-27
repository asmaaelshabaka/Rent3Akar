import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../propertyDetailScreen/propertyDetailScreen.dart';

class PropertyBoxDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(PropertyDetailScreen());
        },
        child: Container(
          child: Column(
            children: [
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),child: Image.asset('assets/images/apartment1.jpg')),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Avaliable Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('01-01-2023')
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rent Per Month',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('2000 Egp')
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Increase Rate',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('10%')
                      ])
                ],
              )
            ],
          ),
        ));
  }
}
