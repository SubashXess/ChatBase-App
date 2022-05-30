import 'package:flutter/material.dart';

BoxShadow boxShadowStyle(Color color) {
  return BoxShadow(
    color: color,
    spreadRadius: 0.0,
    blurRadius: 4.0,
    offset: const Offset(1.5, 2.5),
  );
}
