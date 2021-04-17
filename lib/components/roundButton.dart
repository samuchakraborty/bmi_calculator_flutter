import 'package:flutter/material.dart';

Widget roundIconButton({@required icon, @required onPress}) {
  return RawMaterialButton(
    onPressed: onPress,
    shape: CircleBorder(),
    fillColor: Color(0xFF4C4F5E),
    elevation: 1,
    constraints: BoxConstraints.tightFor(width: 56, height: 56),
    child: Icon(icon),
  );
}