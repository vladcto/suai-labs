import 'dart:core';
import 'dart:math';

import '../models/point2.dart';

extension DistributionMapStatistics on Map<double, double> {
  List<Point2> get cumulativeDistribution {
    final listEntries = entries.toList();
    final res = <Point2>[];
    var cumulative = listEntries.first.value;
    res.add(Point2(listEntries.first.key, cumulative));

    for (int i = 1; i < listEntries.length; i++) {
      cumulative = (cumulative + listEntries[i].value);
      res.add(Point2(listEntries[i].key, cumulative));
    }

    return res;
  }

  double calcCumulativeProbability(double end, {double start = 0}) {
    double cumulativeProbability = 0.0;

    forEach((key, value) {
      if (start <= key && key <= end) {
        cumulativeProbability += value;
      }
    });

    return cumulativeProbability;
  }

  double get mean {
    double mean = 0.0;

    forEach((key, value) {
      mean += key * value;
    });

    return mean;
  }

  double get secondMoment {
    double secondMoment = 0.0;

    forEach((key, value) {
      secondMoment += (key * key) * value;
    });

    return secondMoment;
  }

  double get thirdMoment {
    double thirdMoment = 0.0;

    forEach((key, value) {
      thirdMoment += (key * key * key) * value;
    });

    return thirdMoment;
  }

  double get fourthMoment {
    double fourthMoment = 0.0;

    forEach((key, value) {
      fourthMoment += (key * key * key * key) * value;
    });

    return fourthMoment;
  }

  double get mode {
    double mode = entries.first.key;
    double maxProbability = entries.first.value;

    // Пройдитесь по всем парам ключ-значение в вашей вероятностной карте
    forEach((key, probability) {
      if (probability > maxProbability) {
        mode = key;
        maxProbability = probability;
      }
    });

    return mode;
  }

  double get median {
    final sortedEntries = entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    final numEntries = sortedEntries.length;

    if (numEntries % 2 == 0) {
      final middle1 = sortedEntries[numEntries ~/ 2 - 1].key;
      final middle2 = sortedEntries[numEntries ~/ 2].key;
      return (middle1 + middle2) / 2.0;
    } else {
      return sortedEntries[numEntries ~/ 2].key.toDouble();
    }
  }

  double get excess {
    double mean = 0.0;
    double variance = 0.0;

    forEach((key, value) {
      mean += key * value;
    });

    forEach((key, value) {
      variance += (key - mean) * (key - mean) * value;
    });

    final stdDev = sqrt(variance);
    final numEntries = length.toDouble();

    double excess = 0.0;
    forEach((key, value) {
      excess += ((key - mean) * (key - mean) * (key - mean) * value) /
          (stdDev * stdDev * stdDev);
    });

    return excess / numEntries;
  }

  double get variance {
    double mean = 0.0;
    double variance = 0.0;

    forEach((key, value) {
      mean += key * value;
    });

    forEach((key, value) {
      variance += ((key - mean) * (key - mean)) * value;
    });

    return variance;
  }

  double get standardDeviation => sqrt(variance);

  double get skewness {
    double thirdMoment = this.thirdMoment;
    final stdDev = standardDeviation;

    final numEntries = length.toDouble();
    double skewness = thirdMoment / (stdDev * stdDev * stdDev * numEntries);
    return skewness;
  }

  double get centralSecondMoment {
    double centralSecondMoment = 0.0;

    forEach((key, value) {
      centralSecondMoment += ((key - mean) * (key - mean)) * value;
    });

    return centralSecondMoment;
  }

  double get centralThirdMoment {
    double centralThirdMoment = 0.0;

    forEach((key, value) {
      centralThirdMoment +=
          ((key - mean) * (key - mean) * (key - mean)) * value;
    });

    return centralThirdMoment;
  }

  double get centralFourthMoment {
    double centralFourthMoment = 0.0;

    forEach((key, value) {
      centralFourthMoment +=
          ((key - mean) * (key - mean) * (key - mean) * (key - mean)) * value;
    });

    return centralFourthMoment;
  }
}
