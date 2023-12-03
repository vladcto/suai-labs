import 'package:fl_chart/fl_chart.dart';
import 'package:my_math/my_math.dart';

class FirstCalculationManager {
  final double step;
  final MathInterval interval;
  final Func function1;
  final Func function2;

  FirstCalculationManager({
    required this.step,
    required this.interval,
    required this.function1,
    required this.function2,
  });

  List<FlSpot> get function1Dots {
    return interval.stepped(
      step: step,
      map: (x) => FlSpot(x, function1(x)),
    );
  }

  List<FlSpot> get function2Dots {
    return interval.stepped(
      step: step,
      map: (x) => FlSpot(x, function2(x)),
    );
  }

  double get scalar => Algebra.scalarProduct(function1, function2, interval);

  double get function1Norm => function1.integral(interval: interval).norm;

  double get function2Norm => function2.integral(interval: interval).norm;

  Func get _func1Normalize => (x) => function1(x) / function1Norm;

  Func get _func2Normalize => (x) => function2(x) / function2Norm;

  double get function1NormalizeNorm {
    return _func1Normalize.integral(interval: interval).norm;
  }

  double get function2NormalizeNorm {
    return _func2Normalize.integral(interval: interval).norm;
  }

  bool get isNormalizedOrthogonal => Algebra.isOrthogonal(
        _func1Normalize,
        _func2Normalize,
        interval,
      );

  bool get isOrthogonal => Algebra.isOrthogonal(
        function1,
        function2,
        interval,
      );

  bool get isOrthogonalWithDoubleHz => Algebra.isOrthogonal(
        (x) => function1(x * 2),
        (x) => function2(x * 2),
        interval,
      );

  bool get isOrthogonalWithShortInterval => Algebra.isOrthogonal(
        function1,
        function2,
        interval * 0.5,
      );

  bool get isOrthogonalWithBigInterval => Algebra.isOrthogonal(
        function1,
        function2,
        interval * 2,
      );
}
