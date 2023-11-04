import 'package:my_math/src/utils/const.dart';

import '../models/math_interval.dart';
import '../utils/typedefs.dart';

abstract final class Algebra {
  static double scalarProduct(Func f1, Func f2, MathInterval interval) {
    final start = interval.start;
    final end = interval.end;

    int n = Const.integralN;
    double h = (end - start) / n;

    double result = 0.0;

    for (int i = 0; i < n; i++) {
      double x = start + i * h;
      result += f1(x) * f2(x);
    }

    return result * h;
  }

  static bool isOrthogonal(Func f1, Func f2, MathInterval interval) =>
      areSimilar(scalarProduct(f1, f2, interval), 0);

  static bool areSimilar(double a, double b) {
    return (a - b).abs() < Const.epsilon;
  }
}
