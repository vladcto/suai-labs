import 'package:extend_math/extend_math.dart';
import 'package:lab2/logic/variant.dart';
import 'package:ui_kit/ui_kit.dart';

abstract final class Calculations {
  static const _numPoints = 1000;
  static final _k = Variant.interval.findCoefficientK(Variant.fx, 0.00001);

  static double fx(double x) => _k * Variant.fx(x);

  static final List<KitDot> densityGraphPoints = () {
    final start = Variant.interval.start;
    final end = Variant.interval.end;
    List<KitDot> points = [];
    double step = (end - start) / _numPoints;
    for (double x = start; x <= end; x += step) {
      points.add(
        KitDot(x, fx(x)),
      );
    }
    return points;
  }();

  static final List<KitDot> distributionGraphPoints = () {
    final start = Variant.interval.start;
    final end = Variant.interval.end;
    List<KitDot> points = [];
    double step = (end - start) / _numPoints;
    double cumulative = 0.0;
    for (double x = start; x <= end; x += step) {
      cumulative += fx(x) * step;
      points.add(KitDot(x, cumulative));
    }
    return points;
  }();

  static final Map<double, double> distributionGraphMap = () {
    final Map<double, double> res = {};
    var cumulative = 0.0;
    for (var dot in distributionGraphPoints) {
      res[dot.x] = dot.y - cumulative;
      cumulative = dot.y;
    }
    return res;
  }();
}
