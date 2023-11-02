import 'dart:math';

import '../models/point2.dart';

extension AmplitudeSpectrumExtension on List<Point2> {
  double amplitudeSpectrumFor(
    double freq, {
    required double step,
  }) {
    double realPart = 0.0;
    double imagPart = 0.0;

    for (int j = 0; j < length; j++) {
      double value = this[j].y;
      double angle = 2 * pi * freq * this[j].x;
      realPart += value * cos(angle) * step;
      imagPart += value * sin(angle) * step;
    }

    return sqrt(realPart * realPart + imagPart * imagPart);
  }
}
