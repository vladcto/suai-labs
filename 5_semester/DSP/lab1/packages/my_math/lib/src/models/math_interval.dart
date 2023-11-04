class MathInterval {
  final double start;
  final double end;

  MathInterval(this.start, this.end);

  MathInterval operator *(double multiplier) {
    return MathInterval(start * multiplier, end * multiplier);
  }
}
