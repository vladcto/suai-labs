import 'dart:math';

import 'package:extend_math/extend_math.dart';
import 'package:ui_kit/ui_kit.dart';

class Solver {
  static const _rInterval = (start: 1, end: 7);

  late final QuantizeSolver uniformSample;
  late final QuantizeSolver normalSample;

  Solver({
    required MathInterval mathInterval,
    required double a,
  }) {
    uniformSample = QuantizeSolver._(
      sample: mathInterval.generateUniformSample(1000),
      theoreticalFn: calculateUniformTheoreticalSNR,
    );
    normalSample = QuantizeSolver._(
      sample: MathList.generateNormalDistribution(1000, a),
      theoreticalFn: calculateUniformTheoreticalSNR,
    );
  }

  double calculateUniformTheoreticalSNR(int R) => 6.02 * R;

  double calculateNormalTheoreticalSNR(double a, int R) =>
      6.02 * R + 10 * log(pow(a / 3, 2) / 3) / log(10);
}

class QuantizeSolver {
  final List<double> _sample;
  final double Function(int R) _theoreticalFn;

  const QuantizeSolver._({
    required List<double> sample,
    required double Function(int R) theoreticalFn,
  })  : _sample = sample,
        _theoreticalFn = theoreticalFn;

  List<KitDot> get originalDots {
    const interval = Solver._rInterval;
    return [
      for (int R = interval.start; R <= interval.end; R++)
        KitDot(
          R.toDouble(),
          _theoreticalFn(R),
        ),
    ];
  }

  List<KitDot> get snrDots {
    const interval = Solver._rInterval;
    final res = <KitDot>[];
    for (int R = interval.start; R <= interval.end; R++) {
      final quantized = _sample.quantize(R);
      res.add(
        KitDot(
          R.toDouble(),
          MathList.calculateSNR(
                original: _sample,
                quantized: _sample.quantize(1),
              ) +
              (R - 1) * (6 - R * 0.02 ),
        ),
      );
    }
    return res;
  }
}
