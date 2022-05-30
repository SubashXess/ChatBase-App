import 'package:flutter/material.dart';

TextStyle textStyleSimple(
  Color color,
  double fontSize,
  FontWeight fontWeight, [
  TextOverflow? overflow,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    decoration: TextDecoration.none,
    overflow: overflow,

    // fontFamily: fontFamily,
  );
}
