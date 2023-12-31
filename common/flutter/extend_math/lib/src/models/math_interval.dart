final class MathInterval {
  final double start;
  final double end;

  const MathInterval(this.start, this.end);

  double get length => (end - start).abs();
}
