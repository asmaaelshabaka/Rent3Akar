import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/constants.dart';
import '../../../controllers/PropertyController.dart';

class PropertyTableDetails extends StatelessWidget {
  PropertyController propertyController = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Constants.HorizontalPadding,
          vertical: Constants.VerticalPadding),
      child: Container(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rent Price',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                propertyController.mypropertyModel.value.RentCost.toString(),
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Space',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                propertyController.mypropertyModel.value.Space.toString(),
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [              Text(
            'More Info',
            style: TextStyle(
                color: Colors.black45,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
            Text(
              propertyController.mypropertyModel.value.MoreData.toString(),
              style: TextStyle(fontSize: 10),
            )],),
          SizedBox(height: 5,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [              Text(
              'Rate Per Year',
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
              Text(
                  propertyController.mypropertyModel.value.IncreaseRate.toString(),
                style: TextStyle(fontSize: 10),
              )],),
          SizedBox(height: 5,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [              Text(
              'Location',
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
              Text(
                'Third District seconf floor',
                style: TextStyle(fontSize: 10),
              )],)
        ],
      )),
    );
  }
}
