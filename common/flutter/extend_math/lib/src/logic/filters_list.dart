abstract final class FiltersList {
  static List<double> medianFilter(List<double> input, int order) {
    final result = List<double>.from(input);

    for (int i = 0; i < input.length; i++) {
      final values = <double>[];

      for (int j = i - order ~/ 2; j <= i + order ~/ 2; j++) {
        if (j >= 0 && j < input.length) {
          values.add(input[j]);
        }
      }

      values.sort();
      result[i] = values[order ~/ 2];
    }

    return result;
  }

  static List<double> movingAverageFilter(List<double> input, int order) {
    final result = List<double>.from(input);

    for (int i = 0; i < input.length; i++) {
      double sum = 0.0;
      int count = 0;

      for (int j = i - order ~/ 2; j <= i + order ~/ 2; j++) {
        if (j >= 0 && j < input.length) {
          sum += input[j];
          count++;
        }
      }

      result[i] = sum / count;
    }

    return result;
  }
}
