import 'package:extend_math/extend_math.dart';
import 'package:lab2/logic/variant.dart';

abstract final class MathCalculations {
  static final fxPoints = Variant.interval.applyFx(
    Variant.fx,
    step: Variant.step,
  );
}
