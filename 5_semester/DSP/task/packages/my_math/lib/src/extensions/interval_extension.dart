import '../models/math_interval.dart';

extension IntervalExt on MathInterval {
  double get length => end - start;

  List<T> stepped<T>({required final step, required Function(double x) map}) {
    return [for (var x = start; x < end; x += step) map(x)];
  }
}
