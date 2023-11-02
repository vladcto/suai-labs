import 'dart:math';

import '../models/point2.dart';

extension AmplitudeSpectrumExtension on List<Point2> {
  double amplitudeSpectrumFor(
    double freq, {
    required double step,
  }) {
    double realPart = 0.0;
    double imagPart = 0.0;

    for (int n = 0; n < length; n++) {
      double angle = 2 * pi * freq * this[n].x;
      realPart += this[n].y * cos(angle) * step;
      imagPart += this[n].y * sin(angle) * step;
    }

    return sqrt(realPart * realPart + imagPart * imagPart) / length;
  }
}
