import 'package:extend_math/extend_math.dart';
import 'package:flutter/material.dart';
import 'package:lab2/logic/math_calculations.dart';
import 'package:lab2/logic/variant.dart';
import 'package:ui_kit/ui_kit.dart';

class PreviewApp extends StatelessWidget {
  static const _itemsPadding = 16.0;
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    var i = 0;
    var spectrum = [
      for (var i = 0.0; i < 90; i += 1)
        MathCalculations.fxPoints.amplitudeSpectrumFor(i, step: Variant.step)
    ];

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(_itemsPadding),
            child: KitTitleContainer(
              title: 'График',
              child: KitLineChart(
                yAxisName: 'u(t)',
                xAxisName: 't',
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
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(_itemsPadding),
            child: KitTitleContainer(
              title: 'Амплитудный спектр',
              child: Column(
                children: [
                  Expanded(
                    child: KitLineChart(
                      yAxisName: 'Амплитуда',
                      xAxisName: 'Частота',
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
                  const SizedBox(height: 16),
                  KitText.subtitle("Энергия: ${spectrum.energy}"),
                  KitText.subtitle(
                    "Равенство: ${MathCalculations.equalEnergy}",
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
