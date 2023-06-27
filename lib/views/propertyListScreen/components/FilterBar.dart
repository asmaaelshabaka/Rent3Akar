import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(padding: EdgeInsets.all(15),decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),child: Text('Avilable Date',style: TextStyle(fontWeight: FontWeight.bold),)),
            Container(padding: EdgeInsets.all(15),decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),child: Text('Rent',style: TextStyle(fontWeight: FontWeight.bold),)),

          ],
        ),
      ),
    );
  }
}
