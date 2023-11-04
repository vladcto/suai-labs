import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wav/wav_file.dart';

Future<List<double>> extractAudioData(String filePath) async {
  final data = await rootBundle.load('assets/test1.wav');
  final bytes = data.buffer.asUint8List();
  final waveFile = Wav.read(bytes);
  final List<double> audioData =
      waveFile.toMono().toList();
  return audioData;
}
