import 'package:flutter/material.dart';
import 'package:lab4/logic/audio.dart';
import 'package:lab4/logic/calculations.dart';
import 'package:lab4/logic/variant.dart';
import 'package:lab4/ui/preview_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Calculations.readedAudio = await extractAudioData(Variant.filePath);
  print(Calculations.match);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: PreviewApp(),
        ),
      ),
    );
  }
}
