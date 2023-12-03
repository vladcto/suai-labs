import 'dart:math';

import '../models/point2.dart';

extension DoubleListExt on List<double> {
  List<double> quantize(int R) {
    double range = reduce(max) - reduce(min);
    double step = range / (2 * R);

    return map((value) {
      int quantizedValue = (value / step).round();
      return quantizedValue * step;
    }).toList();
  }

  List<Point2> joinX(List<double> x) {
    return indexed.map((e) {
      final (index, y) = e;
      return Point2(x[index], y);
    }).toList();
  }
}
