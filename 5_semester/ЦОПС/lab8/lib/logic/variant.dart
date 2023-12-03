import 'dart:math';

import 'package:extend_math/extend_math.dart';

abstract final class Variant{
  static const variant = 9;
  static const frequency1 = 1.5 * variant;
  static const frequency2 = 1.75 * variant;
  static const frequency3 = 2.0 * variant;
  static const frequency4 = 3.0 * variant;
  static const frequency5 = 1000.0 * variant;
  static const interval = MathInterval(0, 10 / variant);
  static double fx(double x) => sin(2 * pi * variant * x);
}