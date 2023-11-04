import 'package:complex/complex.dart';
import 'package:extend_math/extend_math.dart';

abstract final class Calculations {
  // Yep, its not good but fast!
  static late List<double> readedAudio;

  static List<Point2> get points {
    return readedAudio
        .asMap()
        .entries
        .map((e) => Point2(e.key.toDouble(), e.value))
        .toList();
  }

  static List<Point2>? cachedDft;
  static List<Point2> get dft {
    if (cachedDft != null) return cachedDft!;
    cachedDft = points.dft
        .asMap()
        .entries
        .map((e) => Point2(e.key.toDouble(), e.value.abs()))
        .toList();
    return cachedDft!;
  }

  static List<String> get match {
    final spectralComponents = points.dft;
    // Определите пороги для определения наличия частот в спектре
    double magnitudeThreshold = 200.0; // Подстройте подходящий порог
    double frequencyThreshold = 150.0; // Подстройте подходящий порог

    List<String> dtmfCodes = [];

    for (int i = 1; i < spectralComponents.length - 1; i++) {
      Complex current = spectralComponents[i];

      double magnitude = current.abs();
      double frequency = i * 16000 / spectralComponents.length;

      if (magnitude > magnitudeThreshold) {
        if ((frequency % 697) < frequencyThreshold ||
            (frequency % 1209) < frequencyThreshold) {
          dtmfCodes.add('1');
        } else if ((frequency % 697) < frequencyThreshold ||
            (frequency % 1336) < frequencyThreshold) {
          dtmfCodes.add('2');
        } else if ((frequency % 697) < frequencyThreshold ||
            (frequency % 1477) < frequencyThreshold) {
          dtmfCodes.add('3');
        } else if ((frequency % 697) < frequencyThreshold ||
            (frequency % 1633) < frequencyThreshold) {
          dtmfCodes.add('A');
        } else if ((frequency % 770) < frequencyThreshold ||
            (frequency % 1209) < frequencyThreshold) {
          dtmfCodes.add('4');
        } else if ((frequency % 770) < frequencyThreshold ||
            (frequency % 1336) < frequencyThreshold) {
          dtmfCodes.add('5');
        } else if ((frequency % 770) < frequencyThreshold ||
            (frequency % 1477) < frequencyThreshold) {
          dtmfCodes.add('6');
        } else if ((frequency % 770) < frequencyThreshold ||
            (frequency % 1633) < frequencyThreshold) {
          dtmfCodes.add('B');
        } else if ((frequency % 852) < frequencyThreshold ||
            (frequency % 1209) < frequencyThreshold) {
          dtmfCodes.add('7');
        } else if ((frequency % 852) < frequencyThreshold ||
            (frequency % 1336) < frequencyThreshold) {
          dtmfCodes.add('8');
        } else if ((frequency % 852) < frequencyThreshold ||
            (frequency % 1477) < frequencyThreshold) {
          dtmfCodes.add('9');
        } else if ((frequency % 852) < frequencyThreshold ||
            (frequency % 1633) < frequencyThreshold) {
          dtmfCodes.add('C');
        } else if ((frequency % 941) < frequencyThreshold ||
            (frequency % 1209) < frequencyThreshold) {
          dtmfCodes.add('*');
        } else if ((frequency % 941) < frequencyThreshold ||
            (frequency % 1336) < frequencyThreshold) {
          dtmfCodes.add('0');
        } else if ((frequency % 941) < frequencyThreshold ||
            (frequency % 1477) < frequencyThreshold) {
          dtmfCodes.add('#');
        } else if ((frequency % 941) < frequencyThreshold ||
            (frequency % 1633) < frequencyThreshold) {
          dtmfCodes.add('D');
        }
      }
    }

    return dtmfCodes.toList();
  }

  static List<int> findFrequencyPeaks(
      List<Complex> spectralComponents, int sampleRate) {
    List<int> peaks = [];
    double threshold =
        200.0; // Установите подходящий порог для определения пиков

    for (int i = 1; i < spectralComponents.length - 1; i++) {
      double magnitude = spectralComponents[i].abs();
      if (magnitude > threshold &&
          magnitude > spectralComponents[i - 1].abs() &&
          magnitude > spectralComponents[i + 1].abs()) {
        double frequency = i * sampleRate / spectralComponents.length;
        peaks.add(frequency.round());
      }
    }

    return peaks;
  }

  static List<String> matchFrequenciesToDTMF(List<int> frequencies) {
    final dtmfFrequencies = {
      697 / 1209: '1',
      697 / 1336: '2',
      697 / 1477: '3',
      697 / 1633: 'A',
      770 / 1209: '4',
      770 / 1336: '5',
      770 / 1477: '6',
      770 / 1633: 'B',
      852 / 1209: '7',
      852 / 1336: '8',
      852 / 1477: '9',
      852 / 1633: 'C',
      941 / 1209: '*',
      941 / 1336: '0',
      941 / 1477: '#',
      941 / 1633: 'D'
    };

    List<String> dtmfCodes = [];
    for (int frequency in frequencies) {
      String closestFrequency = findClosestFrequency(
        frequency,
        dtmfFrequencies.keys.toList(),
      ).toString();
      dtmfCodes.add(dtmfFrequencies[closestFrequency] ?? "???");
    }

    return dtmfCodes;
  }

  static double findClosestFrequency(
      int targetFrequency, List<double> frequencies) {
    var minDifference = 99999999.0;
    late double closestFrequency;

    for (var frequency in frequencies) {
      var difference = (frequency - targetFrequency).abs();
      if (difference < minDifference) {
        minDifference = difference;
        closestFrequency = frequency;
      }
    }

    return closestFrequency;
  }
}
