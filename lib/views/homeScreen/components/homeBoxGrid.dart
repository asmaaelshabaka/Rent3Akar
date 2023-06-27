import 'package:flutter/material.dart';


class HomeBoxGrid extends StatelessWidget {
  HomeBoxGrid(this.AreaName, this.Icon, this.onttab);
  final String AreaName;
  final String Icon;
  final VoidCallback onttab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap:onttab,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(24)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //icon
              Image.network(
                Icon,
                height: 65,


              ),

              //AreaName
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      AreaName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
