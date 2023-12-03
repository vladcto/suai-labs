import 'dart:math';

import 'package:extend_math/src/utils/math_ext.dart';

abstract final class MathList {
  static double calculateSNR({
    required List<double> original,
    required List<double> quantized,
  }) {
    double signalPower = 0;
    double noisePower = 0;

    for (int i = 0; i < original.length; i++) {
      signalPower += original[i] * original[i];
      noisePower += (original[i] - quantized[i]) * (original[i] - quantized[i]);
    }

    return 10 * log10(signalPower / noisePower);
  }

  static List<double> generateNormalDistribution(int size, double a) {
    Random random = Random();
    return List.generate(size, (index) {
      double u1 = 1.0 - random.nextDouble();
      double u2 = random.nextDouble();
      double z = sqrt(-2 * log(u1)) * cos(2 * pi * u2);
      return z * a;
    });
  }

  static double calculateRMSE(List<double> original, List<double> filtered) {
    print("${original.length}:${filtered.length}");
    final squaredDifferences = List<double>.generate(
      original.length,
      (index) => pow(original[index] - filtered[index], 2).toDouble(),
    );

    final meanSquaredDifference =
        squaredDifferences.reduce((a, b) => a + b) / original.length;

    return sqrt(meanSquaredDifference);
  }
}
