import 'package:extend_math/extend_math.dart';
import 'package:flutter/material.dart';
import 'package:lab2/logic/math_calculations.dart';
import 'package:lab2/logic/variant.dart';
import 'package:ui_kit/ui_kit.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    var i = 0;
    var spectrum = [
      for (var i = 0.0; i < 90; i += 1)
        MathCalculations.fxPoints.amplitudeSpectrumFor(i, step: Variant.step)
    ];

    return Center(
      child: SizedBox(
        width: 900,
        child: ListView(
          children: [
            SizedBox(
              height: 450,
              child: KitTitleContainer(
                title: 'Hello',
                child: KitLineChart(
                  lines: [
                    KitLineData(
                      dots: MathCalculations.fxPoints
                          .map(
                            (e) => KitDot(e.x, e.y),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 450,
              child: KitTitleContainer(
                title: 'Hello',
                child: KitLineChart(
                  lines: [
                    KitLineData(
                      dots: spectrum
                          .map(
                            (e) => KitDot((i++).toDouble(), e),
                          )
                          .toList(),
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
