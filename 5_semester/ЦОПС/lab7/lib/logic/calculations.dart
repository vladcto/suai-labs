import 'dart:math';

import 'package:extend_math/extend_math.dart';
import 'package:lab7/logic/variant.dart';
import 'package:ui_kit/ui_kit.dart';

abstract final class Calculations {
  static final random = Random();
  static final dots = Variant.interval.applyFx(Variant.fn, step: Variant.step);
  static final noisedDots =
      dots.map((e) => Point2(e.x, e.y + random.nextDouble() * 2 - 1)).toList();
  static final xDots = noisedDots.xDots;
  static final filterDots = ButterworthFilter(noisedDots);

  // 2 order
  static final lowPassFilter2 = LowPassFilter2ndOrder(1.8);
  static final lowPass2 = calculateACHX(calculateSpectrum(
      noisedDots.map((e) => Point2(e.x, lowPassFilter2.filter(e.y))).toList()));

  static final highPassFilter2 = HighPassFilter2ndOrder(0.6);
  static final highPass2 = calculateACHX(calculateSpectrum(noisedDots
      .map((e) => Point2(e.x, highPassFilter2.filter(e.y)))
      .toList()));

  static final bandPassFilter2 = BandPassFilter2ndOrder(0.8, 0.8);
  static final bandPass2 =
      noisedDots.map((e) => Point2(e.x, bandPassFilter2.filter(e.y))).toList();

  static final notchFilter2 = NotchFilter2ndOrder(0.4, 0.4);
  static final notch2 =
      noisedDots.map((e) => Point2(e.x, notchFilter2.filter(e.y))).toList();

  // 3 order
  static final lowPassFilter3 = LowPassFilter3rdOrder(0.2, 0.2, 0.2);
  static final lowPass3 =
      noisedDots.map((e) => Point2(e.x, lowPassFilter3.filter(e.y))).toList();

  static final highPassFilter3 = HighPassFilter3rdOrder(0.2, 0.2, 0.2, 0.2);
  static final highPass3 =
      noisedDots.map((e) => Point2(e.x, highPassFilter3.filter(e.y))).toList();

  static final bandPassFilter3 = BandPassFilter3rdOrder(0.4, 0.4, 0.4);
  static final bandPass3 =
      noisedDots.map((e) => Point2(e.x, bandPassFilter3.filter(e.y))).toList();

  static final notchFilter3 = NotchFilter3rdOrder(0.4, 0.4, 0.4);
  static final notch3 =
      noisedDots.map((e) => Point2(e.x, notchFilter3.filter(e.y))).toList();
}

extension Point2ToKitDot on List<Point2> {
  List<KitDot> get toKitDot => map((e) => KitDot(e.x, e.y)).toList();
}

class LowPassFilter2ndOrder {
  double alpha;
  double yPrev = 0;
  double xPrev = 0;

  LowPassFilter2ndOrder(this.alpha);

  double filter(double x) {
    double y = alpha * x + (1.0 - alpha) * yPrev;
    yPrev = y;
    xPrev = x;
    return y;
  }
}

class LowPassFilter3rdOrder {
  double alpha;
  double beta;
  double gamma;
  double yPrev1 = 0;
  double yPrev2 = 0;
  double yPrev3 = 0;
  double xPrev = 0;

  LowPassFilter3rdOrder(this.alpha, this.beta, this.gamma);

  double filter(double x) {
    double y = alpha * x +
        beta * yPrev1 +
        gamma * yPrev2 +
        (1.0 - alpha - beta - gamma) * yPrev3;
    yPrev3 = yPrev2;
    yPrev2 = yPrev1;
    yPrev1 = y;
    xPrev = x;
    return y;
  }
}

class HighPassFilter2ndOrder {
  double alpha;
  double yPrev = 0;
  double xPrev = 0;

  HighPassFilter2ndOrder(this.alpha);

  double filter(double x) {
    double y = alpha * (yPrev + x - xPrev);
    yPrev = y;
    xPrev = x;
    return x - y;
  }
}

class HighPassFilter3rdOrder {
  double alpha;
  double beta;
  double gamma;
  double delta;
  double yPrev1 = 0;
  double yPrev2 = 0;
  double yPrev3 = 0;
  double yPrev4 = 0;
  double xPrev = 0;

  HighPassFilter3rdOrder(this.alpha, this.beta, this.gamma, this.delta);

  double filter(double x) {
    double y = alpha * (yPrev1 + x - xPrev) +
        beta * yPrev2 +
        gamma * yPrev3 +
        delta * yPrev4;
    yPrev4 = yPrev3;
    yPrev3 = yPrev2;
    yPrev2 = yPrev1;
    yPrev1 = y;
    xPrev = x;
    return x - y;
  }
}

class BandPassFilter2ndOrder {
  double alpha;
  double beta;
  double yPrev1 = 0;
  double yPrev2 = 0;
  double xPrev = 0;

  BandPassFilter2ndOrder(this.alpha, this.beta);

  double filter(double x) {
    double y = alpha * (x - xPrev) + beta * (yPrev1 - yPrev2);
    yPrev2 = yPrev1;
    yPrev1 = y;
    xPrev = x;
    return y;
  }
}

class BandPassFilter3rdOrder {
  double alpha;
  double beta;
  double gamma;
  double yPrev1 = 0.0;
  double yPrev2 = 0.0;
  double yPrev3 = 0.0;
  double xPrev = 0;

  BandPassFilter3rdOrder(this.alpha, this.beta, this.gamma);

  double filter(double x) {
    double y = alpha * (x - xPrev) +
        beta * (yPrev1 - yPrev2) +
        gamma * (yPrev2 - yPrev3);
    yPrev3 = yPrev2;
    yPrev2 = yPrev1;
    yPrev1 = y;
    xPrev = x;
    return y;
  }
}

class NotchFilter2ndOrder {
  double alpha;
  double beta;
  double yPrev1 = 0;
  double yPrev2 = 0;
  double xPrev = 0;

  NotchFilter2ndOrder(this.alpha, this.beta);

  double filter(double x) {
    double y = alpha * (x - xPrev) + beta * (yPrev1 - yPrev2);
    yPrev2 = yPrev1;
    yPrev1 = y;
    xPrev = x;
    return x - y;
  }
}

class NotchFilter3rdOrder {
  double alpha;
  double beta;
  double gamma;
  double yPrev1 = 0;
  double yPrev2 = 0;
  double yPrev3 = 0;
  double xPrev = 0;

  NotchFilter3rdOrder(this.alpha, this.beta, this.gamma);

  double filter(double x) {
    double y = alpha * (x - xPrev) +
        beta * (yPrev1 - yPrev2) +
        gamma * (yPrev2 - yPrev3);
    yPrev3 = yPrev2;
    yPrev2 = yPrev1;
    yPrev1 = y;
    xPrev = x;
    return x - y;
  }
}

List<Point2> calculateLACHX(List<Point2> signal) {
  int N = signal.length;
  List<Point2> lachx = <Point2>[];

  for (int k = 0; k < N; k++) {
    double sumReal = 0;
    double sumImaginary = 0;

    for (int n = 0; n < N; n++) {
      double angle = -2 * pi * k * n / N;
      double realPart = signal[n].y * cos(angle);
      double imaginaryPart = signal[n].y * sin(angle);

      sumReal += realPart;
      sumImaginary += imaginaryPart;
    }

    double magnitude = sqrt(sumReal * sumReal + sumImaginary * sumImaginary);
    double lachxValue =
        20 * log(magnitude) / log(10); // Преобразование в децибелы

    lachx.add(Point2(k.toDouble(), lachxValue));
  }

  return lachx;
}

List<Point2> calculateSpectrum(List<Point2> signal) {
  int N = signal.length;
  List<Point2> spectrum = <Point2>[];

  for (int k = 0; k < N; k++) {
    double sumReal = 0;
    double sumImaginary = 0;

    for (int n = 0; n < N; n++) {
      double angle = -2 * pi * k * n / N;
      double realPart = signal[n].y * cos(angle);
      double imaginaryPart = signal[n].y * sin(angle);

      sumReal += realPart;
      sumImaginary += imaginaryPart;
    }

    double magnitude = sqrt(sumReal * sumReal + sumImaginary * sumImaginary);
    spectrum.add(Point2(k.toDouble(), magnitude));
  }

  return spectrum;
}

List<Point2> calculateACHX(List<Point2> signal) {
  int N = signal.length;
  List<Point2> achx = <Point2>[];

  for (int k = 0; k < N; k++) {
    double sumReal = 0;
    double sumImaginary = 0;

    for (int n = 0; n < N; n++) {
      double angle = -2 * pi * k * n / N;
      double realPart = signal[n].y * cos(angle);
      double imaginaryPart = signal[n].y * sin(angle);

      sumReal += realPart;
      sumImaginary += imaginaryPart;
    }

    double magnitude = sqrt(sumReal * sumReal + sumImaginary * sumImaginary);
    achx.add(Point2(k.toDouble(), magnitude));
  }

  return achx;
}
