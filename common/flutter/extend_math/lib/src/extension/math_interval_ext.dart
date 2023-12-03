import 'dart:math';

import 'package:extend_math/extend_math.dart';

import '../utils/typedefs.dart';

extension MathIntervalExt on MathInterval {
  List<Point2> applyFx(Func1 fx, {required double step}) {
    final res = [
      for (var x = start; x <= end; x += step) Point2(x, fx(x)),
    ];
    if ((end - start) % step != 0) {
      res.add(Point2(end, fx(end)));
    }
    return res;
  }

  List<double> generateUniformSample(int count) {
    Random random = Random();
    return List.generate(
      count,
      (index) => random.nextDouble() * (end - start) + start,
    );
  }

  double findCoefficientK(Func1 fx, double step) {
    double integral = 0.0;
    for (double x = start; x <= end; x += step) {
      integral += fx(x) * step;
    }
    return 1.0 / integral;
  }

  double cumulativeDistributionFunction(Func1 fx) {
    double integral = 0.0;
    double step = 0.0001;
    for (double x = start; x <= end; x += step) {
      integral += fx(x) * step;
    }
    return integral;
  }
}
