// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:complex/complex.dart';

import '../models/point2.dart';

extension DFTExtension on List<Point2> {
  List<Complex> get dft {
    int N = length;
    List<Complex> dftResult = List<Complex>.generate(N, (i) {
      Complex sum = const Complex(0.0, 0.0);
      for (int j = 0; j < N; j++) {
        double angle = 2 * pi * i * j / N;
        Complex c = Complex.polar(this[j].y, angle);
        sum += c;
      }
      return sum;
    });
    return dftResult;
  }
}

extension InverseDFTExtension on List<Complex> {
  List<Point2> get inverseDft {
    final spectrum = this;
    int N = spectrum.length;
    List<Point2> signal = List<Point2>.generate(N, (i) {
      Complex sum = Complex(0.0, 0.0);
      for (int j = 0; j < N; j++) {
        double angle = -2 * pi * i * j / N;
        Complex c = spectrum[j] * Complex.polar(1.0, angle);
        sum += c;
      }
      return Point2(i.toDouble(), sum.real / N);
    });
    return signal;
  }
}
