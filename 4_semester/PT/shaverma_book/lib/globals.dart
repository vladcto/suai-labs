import 'package:flutter/material.dart';

abstract class Globals {
  static Color mainColor = Colors.green;
  static Color secondColor = Colors.red;
  static BoxShadow shadow = const BoxShadow(
    color: Colors.black26,
    offset: Offset(4, 4),
    blurRadius: 4,
  );
}
