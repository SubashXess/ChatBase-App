import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatListOptionMenu {
  String? title;
  FontWeight? fontWeight;
  Color? textColor;
  IconData? icons;
  MaterialColor? color;

  ChatListOptionMenu({
    required this.title,
    this.fontWeight,
    this.textColor,
    required this.color,
    required this.icons,
  });
}
