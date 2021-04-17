import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onPressed, @required this.buttonName});
  final Function onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(top: 10.0),
        height: bottomContainerHeight,
        color: bottomContainerColour,
        child: Text(
          buttonName,
          style: containerButtonTextStyle,
        ),
      ),
    );
  }
}
