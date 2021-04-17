import 'package:flutter/material.dart';

Widget reUseAbleCard({@required colour, @required cardChild, onPress}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        // color: containerColor,
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
      // child: Column(
      //   children: [Icon(Icons.adjust), Text('Male')],
      // ),
    ),
  );
}
