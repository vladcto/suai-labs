import 'package:flutter/material.dart';
import 'package:ui_kit/my_uikit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 800,
        child: ListView(
          children: [
            KitTitleContainer(
              title: 'Text',
              child: Container(
                height: 300,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: KitTitleContainer(
                title: "Скорость машины",
                child: KitLineChart(
                  xAxisName: "Время",
                  yAxisName: "Амплитуда",
                  lines: [
                    KitLineData(
                      color: Colors.orange,
                      dots: [
                        KitDot(1, 2),
                        KitDot(2, 6),
                        KitDot(3, 7),
                        KitDot(4, 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
