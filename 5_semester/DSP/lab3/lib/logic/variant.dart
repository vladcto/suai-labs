import 'dart:math';

import 'package:extend_math/extend_math.dart';

abstract final class Variant {
  static const n = 22;
  static const f = 3 * n;
  static const t = 10 / f;
  static const interval = MathInterval(-t, t);
  static const step = 1 / 3 / f;
  static final fxDots = interval.applyFx(fx, step: step);

  static double fx(double x) => sin(2 * pi * f * x);
}
