import 'package:extend_math/extend_math.dart';

abstract final class Variant{
  static double fx(double x) => x + 4;
  static const interval =  MathInterval(0, 2);
  static const x1 = -1.0;
  static const x2 = 1.5;
}