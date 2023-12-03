import 'dart:core';
import 'dart:math';
import 'package:extend_math/extend_math.dart';

abstract final class Variant {
  static const _n = 5;
  static const fn = 3 * _n;
  static const _t = 10 / fn;

  static double fx(x) => sin(2 * pi * fn * x);
  static const interval = MathInterval(0, _t);
  static const step = 0.001;
}
