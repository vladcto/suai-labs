import 'dart:math';

import '../models/point2.dart';

abstract final class ReconstructSignal {
  static double interpolate(List<Point2> signal, double t, double F) {
    double result = 0.0;

    for (var point in signal) {
      double sincTerm = sinc((t - point.x) * F);
      result += point.y * sincTerm;
    }

    return result;
  }

  static double sinc(double x) {
    if (x == 0) {
      return 1.0;
    } else {
      return sin(pi * x) / (pi * x);
    }
  }

  static List<Point2> reconstructSignal(List<Point2> sampledSignal, double F, List<Point2> targetPoints) {
    List<Point2> reconstructedSignal = [];

    for (var point in targetPoints) {
      double interpolatedValue = interpolate(sampledSignal, point.x, F);
      reconstructedSignal.add(Point2(point.x, interpolatedValue));
    }

    return reconstructedSignal;
  }
}
