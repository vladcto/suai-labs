import 'package:extend_math/extend_math.dart';

import '../utils/typedefs.dart';

extension MathIntervalExt on MathInterval {
  List<Point2> applyFx(Func1 fx, {required double step}) {
    final count = length ~/ step;
    return [
      for (var x = start; x <= end; x += length / count) Point2(x, fx(x))
    ];
  }
}
