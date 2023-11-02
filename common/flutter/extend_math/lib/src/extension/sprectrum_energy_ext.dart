import 'dart:math';

import 'package:extend_math/extend_math.dart';

extension SpectrumAmplEnergyExt on List<double> {
  double get energy {
    final total = sum(map((e) => e * e));
    final normalize = map((e) => e * sqrt(0.5 / total));
    return sum(normalize.map((e) => e * e));
  }
}

extension SpectrumPointEnergyExt on List<Point2> {
  double calculateEnergy(MathInterval interval) {
    double integral = 0;
    for (final point in this) {
      integral += pow(point.y, 2);
    }

    final energy = integral / interval.length;
    return energy;
  }
}
