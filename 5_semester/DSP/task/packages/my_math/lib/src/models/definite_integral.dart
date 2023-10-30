import 'dart:math';

import 'package:my_math/src/utils/const.dart';

import '../../my_math.dart';

class DefiniteIntegral {
  final MathInterval interval;
  final Func f;

  DefiniteIntegral(this.f, {required this.interval});

  double get norm {
    final start = interval.start;
    final end = interval.end;

    int n = Const.integralN;
    double h = (end - start) / n;

    double result = 0.0;

    for (int i = 0; i < n; i++) {
      double x = start + i * h;
      result += pow(f(x), 2);
    }

    result *= h * (1 / (end - start));
    return sqrt(result);
  }
}
