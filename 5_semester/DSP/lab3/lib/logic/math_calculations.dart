import 'package:extend_math/extend_math.dart';
import 'package:lab3/logic/variant.dart';
import 'package:ui_kit/ui_kit.dart';

abstract final class MathCalculations {
  static final f1Dots = Variant.interval.applyFx(
    Variant.fx,
    step: Variant.step,
  );
  static final f2Dots = Variant.interval.applyFx(_fx2, step: Variant.step);

  static List<Point2> get fDotsUnion {
    final dots = Variant.interval.applyFx(
      (x) => Variant.fx(x) + _fx2(x),
      step: Variant.step,
    );
    return dots.dft
        .asMap()
        .entries
        .map((e) => Point2(e.key.toDouble(), e.value.abs()))
        .toList();
  }

  static List<Point2> get fDotsSum {
    final f1Dft = f1Dots.dft;
    final f2Dft = f2Dots.dft;
    return [
      for (int i = 0; i < f1Dft.length; i++)
        Point2(
          i.toDouble(),
          (f1Dft[i] + f2Dft[i]).abs(),
        ),
    ];
  }

  static List<Point2> get shifted => roll(f1Dots, 32)
      .dft
      .asMap()
      .entries
      .map(
        (e) => Point2(
          e.key.toDouble(),
          e.value.abs(),
        ),
      )
      .toList();

  static double get originalEnergy {
    return sum(f1Dots.map((e) => e.y * e.y));
  }

  static double get transformedEnergy {
    return sum(f1Dots.dft.map((e) => e.abs() * e.abs())) / f1Dots.dft.length;
  }

  static double _fx2(double x) {
    return Variant.fx(x) * 0.5;
  }
}
