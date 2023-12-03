import 'package:extend_math/extend_math.dart';
import 'package:flutter/material.dart';
import 'package:lab2/logic/calculations.dart';
import 'package:lab2/logic/variant.dart';
import 'package:ui_kit/ui_kit.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    final map = Calculations.distributionGraphMap;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: KitTitleContainer(
              title: 'Плотность распределения',
              child: KitLineChart(
                lines: [
                  KitLineData(
                    dots: Calculations.densityGraphPoints,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: KitTitleContainer(
              title: 'Функция распределения',
              child: KitLineChart(
                lines: [
                  KitLineData(dots: Calculations.distributionGraphPoints),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                KitTitleContainer(
                  title: "Характеристики",
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      KitText.system("МО: ${map.mean}"),
                      KitText.system("Мода: ${map.mode}"),
                      KitText.system("Медиана: ${map.median}"),
                      KitText.system("Эксцесс: ${map.excess}"),
                      KitText.system("Дисперсия: ${map.variance}"),
                      KitText.system("СКО: ${map.standardDeviation}"),
                      KitText.system("Ассиметрия: ${map.skewness}"),
                      KitText.system(
                        "Нахождение P: ${map.calcCumulativeProbability(Variant.x2, start: Variant.x1)}",
                      ),
                    ],
                  ),
                ),
                KitTitleContainer(
                  title: "Начальный моменты",
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      KitText.system("1 порядок: ${map.mean}"),
                      KitText.system("2 порядок: ${map.secondMoment}"),
                      KitText.system("3 порядок: ${map.thirdMoment}"),
                      KitText.system("4 порядок: ${map.fourthMoment}"),
                    ],
                  ),
                ),
                KitTitleContainer(
                  title: "Центральные моменты",
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      KitText.system("1 порядок: 0"),
                      KitText.system("2 порядок: ${map.centralSecondMoment}"),
                      KitText.system("3 порядок: ${map.centralThirdMoment}"),
                      KitText.system("4 порядок: ${map.centralFourthMoment}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
