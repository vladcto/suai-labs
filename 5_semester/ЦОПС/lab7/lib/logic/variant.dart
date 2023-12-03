import 'package:extend_math/extend_math.dart';
import 'dart:math';

abstract final class Variant {
  static const _n = 5;
  static const fParam = 3 * _n;
  static const T = 10 / fParam;
  static const frequency = 10.0 ;
  static const step = 1 / 15 / fParam;
  static const interval = MathInterval(-T, T);

  static double fn(double x) => sin(2 * pi * fParam * x);
}
