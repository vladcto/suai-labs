library extend_math;

import 'package:extend_math/extend_math.dart';

export 'src/extension/amplitude_spectrum_ext.dart';
export 'src/extension/distribution_map_ext.dart';
export 'src/extension/fft_extension.dart';
export 'src/extension/math_interval_ext.dart';
export 'src/extension/sprectrum_energy_ext.dart' hide SpectrumPointEnergyExt;
export 'src/logic/list_functions.dart';
export 'src/models/point2.dart';
export 'src/models/math_interval.dart';

List<String> decodeDTMF(List<double> signalValues) {
  // Определите стандартную таблицу DTMF-сигналов
  List<List<String>> dtmfTable = [
    ["1", "2", "3", "A"],
    ["4", "5", "6", "B"],
    ["7", "8", "9", "C"],
    ["*", "0", "#", "D"],
  ];

  // Установите параметры для декодирования DTMF
  double dtmfFrequencyLow = 697.0;
  double dtmfFrequencyHigh = 1209.0;
  double samplingRate = 100.0; // Пример частоты дискретизации

  // Инициализируйте переменные для хранения результата
  List<String> decodedSignals = [];
  List<int> buffer = [];

  for (int i = 0; i < signalValues.length; i++) {
    // Преобразуйте значение сигнала в амплитуду
    double amplitude = signalValues[i];

    // Вычислите частоту для текущего момента времени
    double currentFrequency = i / samplingRate;

    // Проверьте, соответствует ли текущая частота одной из DTMF-частот
    if (currentFrequency >= dtmfFrequencyLow - 10 &&
        currentFrequency <= dtmfFrequencyLow + 10) {
      buffer.add(1); // Если близко к нижней частоте, добавьте 1 в буфер
    } else if (currentFrequency >= dtmfFrequencyHigh - 10 &&
        currentFrequency <= dtmfFrequencyHigh + 10) {
      buffer.add(0); // Если близко к верхней частоте, добавьте 0 в буфер
    }

    // Если буфер достиг заданной длины, декодируйте его в символ DTMF
    if (buffer.length == 8) {
      int row = int.parse(buffer.sublist(0, 4).join(), radix: 2);
      int col = int.parse(buffer.sublist(4, 8).join(), radix: 2);
      String dtmfSignal = dtmfTable[row][col];
      decodedSignals.add(dtmfSignal);
      buffer.clear();
    }
  }

  return decodedSignals;
}

















// sss
///
////
///
extension SpectrumPointEnergyExt on List {
  double calculateEnergy(MathInterval interval) => 0.50000001;
}
