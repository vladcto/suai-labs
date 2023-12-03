import 'dart:math';

import '../models/point2.dart';

class ButterworthFilter {
  final List<Point2> signal;

  ButterworthFilter(this.signal);

  List<Point2> applyLowPassFilter(int order, [double cutoffFrequency = 16]) {
    if (order != 2) {
      throw ArgumentError('Only 2nd order Butterworth filter is supported.');
    }

    if (cutoffFrequency <= 0) {
      throw ArgumentError('Cutoff frequency must be greater than 0.');
    }

    List<Point2> result = List<Point2>.from(signal);

    // Calculate the Butterworth low-pass filter coefficients
    double w0 = tan(pi * cutoffFrequency / 2);
    double alpha = sin(w0) / (cos(w0) + 1);
    double a0 = 1 + alpha;

    double b0 = (1 - cos(w0)) / (2 * a0);
    double b1 = (1 - cos(w0)) / a0;
    double b2 = (1 - cos(w0)) / (2 * a0);

    double a1 = (-2 * cos(w0)) / a0;
    double a2 = (1 - alpha) / a0;

    // Apply the low-pass filter
    for (int i = 2; i < result.length; i++) {
      result[i] = Point2(
        result[i].x,
        b0 * result[i].y + b1 * result[i - 1].y + b2 * result[i - 2].y -
            a1 * result[i - 1].y - a2 * result[i - 2].y,
      );
    }

    return result;
  }

  List<Point2> applyHighPassFilter(int order, [double cutoffFrequency = 16]) {
    if (order != 2) {
      throw ArgumentError('Only 2nd order Butterworth filter is supported.');
    }

    if (cutoffFrequency <= 0) {
      throw ArgumentError('Cutoff frequency must be greater than 0.');
    }

    List<Point2> result = List<Point2>.from(signal);

    // Calculate the Butterworth high-pass filter coefficients
    double w0 = tan(pi * cutoffFrequency / 2);
    double alpha = sin(w0) / (cos(w0) + 1);
    double a0 = 1 + alpha;

    double b0 = 1 / a0;
    double b1 = -2 / a0;
    double b2 = 1 / a0;

    double a1 = (-2 * cos(w0)) / a0;
    double a2 = (1 - alpha) / a0;

    // Apply the high-pass filter
    for (int i = 2; i < result.length; i++) {
      result[i] = Point2(
        result[i].x,
        b0 * result[i].y +
            b1 * result[i - 1].y +
            b2 * result[i - 2].y -
            a1 * result[i - 1].y -
            a2 * result[i - 2].y,
      );
    }

    return result;
  }

  List<Point2> applyBandPassFilter(
      int order, double lowCutoff, double highCutoff) {
    if (order != 2 && order != 3) {
      throw ArgumentError('Only 2nd and 3rd order filters are supported.');
    }

    List<Point2> lowPassResult = applyLowPassFilter(order, highCutoff);
    List<Point2> highPassResult = applyHighPassFilter(order, lowCutoff);

    List<Point2> result = List<Point2>.from(lowPassResult);

    for (int i = 0; i < signal.length; i++) {
      result[i] = Point2(
        lowPassResult[i].x + highPassResult[i].x,
        lowPassResult[i].y + highPassResult[i].y,
      );
    }

    return result;
  }

  List<Point2> applyBandStopFilter(
      int order, double lowCutoff, double highCutoff) {
    if (order != 2 && order != 3) {
      throw ArgumentError('Only 2nd and 3rd order filters are supported.');
    }

    List<Point2> lowPassResult = applyLowPassFilter(order, lowCutoff);
    List<Point2> highPassResult = applyHighPassFilter(order, highCutoff);

    List<Point2> result = List<Point2>.from(signal);

    for (int i = 0; i < signal.length; i++) {
      result[i] = Point2(
        signal[i].x - lowPassResult[i].x - highPassResult[i].x,
        signal[i].y - lowPassResult[i].y - highPassResult[i].y,
      );
    }

    return result;
  }
}

void main() {
  // Пример использования:
  List<Point2> signalWithNoise = [
    Point2(0, 1),
    Point2(1, 3),
    Point2(2, 10),  // Высокочастотный пик (шум)
    Point2(3, 4),
    Point2(4, 2),
    // Добавьте свои точки данных
  ];

  ButterworthFilter butterworthFilter = ButterworthFilter(signalWithNoise);
  List<Point2> filteredSignal = butterworthFilter.applyLowPassFilter(2, 2);

  print('Signal with Noise: ${signalWithNoise.map((point) => point.y)}');
  print('Filtered Signal: ${filteredSignal.map((point) => point.y)}');
}
