import 'package:extend_math/extend_math.dart';
import 'package:lab2/logic/variant.dart';

abstract final class MathCalculations {
  static final fxPoints = Variant.interval.applyFx(
    Variant.fx,
    step: Variant.step,
  );

  static final spectrum = [
    for (var i = 0.0; i < 90; i += 1)
      MathCalculations.fxPoints.amplitudeSpectrumFor(i, step: Variant.step)
  ];

  static final equalEnergy =
      (fxPoints.calculateEnergy(Variant.interval) - spectrum.energy) < 0.1;
}
