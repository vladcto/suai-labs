import 'package:extend_math/extend_math.dart';
import 'package:flutter/widgets.dart';
import 'package:lab4/logic/calculations.dart';
import 'package:ui_kit/ui_kit.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: KitTitleContainer(
                  title: 'Амплитуды',
                  child: KitLineChart(
                    lines: [
                      KitLineData(
                        dots: Calculations.points
                            .map((e) => KitDot(e.x, e.y))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: KitTitleContainer(
                  title: 'ДПФ',
                  child: KitLineChart(
                    lines: [
                      KitLineData(
                        dots: Calculations.dft
                            .map((e) => KitDot(e.x, e.y))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: KitTitleContainer(
                  title: 'Обратное ДПФ',
                  child: KitLineChart(
                    lines: [
                      KitLineData(
                        dots: Calculations.points.dft.inverseDft
                            .map((e) => KitDot(e.x, e.y))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
