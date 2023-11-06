import 'package:extend_math/extend_math.dart';
import 'package:flutter/material.dart';
import 'package:lab1/src/logic/variant.dart';
import 'package:ui_kit/ui_kit.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: KitColumn(
            childFit: FlexFit.tight,
            children: [
              KitTitleContainer(
                title: "Многоугольник распределения",
                child: KitLineChart(
                  lines: [
                    KitLineData(
                      curved: false,
                      dots: Variant.distributionMap.entries
                          .map(
                              (pair) => KitDot(pair.key.toDouble(), pair.value))
                          .toList(),
                    ),
                  ],
                ),
              ),
              KitTitleContainer(
                title: "Функция распредления",
                child: KitLineChart(
                  lines: [
                    KitLineData(
                      dots: Variant.distributionMap.cumulativeDistribution
                          .map((pair) =>
                              KitDot(pair.x.toDouble(), pair.y.toDouble()))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: KitColumn(
            mainAxisSize: MainAxisSize.min,
            childFit: FlexFit.loose,
            children: [
              KitTitleContainer(
                title: "Характеристики",
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    KitText.system("Мода: ${Variant.distributionMap.mode}"),
                    KitText.system(
                        "Медиана: ${Variant.distributionMap.median}"),
                    KitText.system(
                        "Эксцесс: ${Variant.distributionMap.excess}"),
                    KitText.system(
                        "Дисперсия: ${Variant.distributionMap.variance}"),
                    KitText.system(
                        "СКО: ${Variant.distributionMap.standardDeviation}"),
                    KitText.system(
                        "Ассиметрия: ${Variant.distributionMap.skewness}"),
                    KitText.system(
                        "Нахождение P(X≤x0): ${Variant.distributionMap.calcCumulativeProbability(-2)}"),
                  ],
                ),
              ),
              KitTitleContainer(
                title: "Начальный моменты",
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    KitText.system(
                        "1 порядок: ${Variant.distributionMap.mean}"),
                    KitText.system(
                        "2 порядок: ${Variant.distributionMap.secondMoment}"),
                    KitText.system(
                        "3 порядок: ${Variant.distributionMap.thirdMoment}"),
                    KitText.system(
                        "4 порядок: ${Variant.distributionMap.fourthMoment}"),
                  ],
                ),
              ),
              KitTitleContainer(
                title: "Центральные моменты",
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    KitText.system("1 порядок: 0"),
                    KitText.system(
                        "2 порядок: ${Variant.distributionMap.centralSecondMoment}"),
                    KitText.system(
                        "3 порядок: ${Variant.distributionMap.centralThirdMoment}"),
                    KitText.system(
                        "4 порядок: ${Variant.distributionMap.centralFourthMoment}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
