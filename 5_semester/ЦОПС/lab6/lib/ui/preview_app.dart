import 'package:extend_math/extend_math.dart';
import 'package:flutter/material.dart';
import 'package:lab6/logic/calculations.dart';
import 'package:ui_kit/ui_kit.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: KitTitleContainer(
            title: "Исходный сигнал с шумом",
            child: KitLineChart(
              lines: [
                KitLineData(
                  dots: Calculations.noisedDots
                      .map((e) => KitDot(e.x, e.y))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                child: KitColumn(
                  childFit: FlexFit.tight,
                  children: [
                    _PreviewFilter(
                      title: "Медианный фильтр 4-го порядка",
                      Calculations.medianFiltered4,
                      Calculations.median4Diff,
                    ),
                    _PreviewFilter(
                      title: "Медианный фильтр 6-го порядка",
                      Calculations.medianFiltered6,
                      Calculations.median6Diff,
                    ),
                    _PreviewFilter(
                      title: "Медианный фильтр 8-го порядка",
                      Calculations.medianFiltered8,
                      Calculations.median6Diff,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: KitColumn(
                  childFit: FlexFit.tight,
                  children: [
                    _PreviewFilter(
                      title: "Скользящее среднее 4-го порядка",
                      Calculations.movingFiltered4,
                      Calculations.avg4Diff,
                    ),
                    _PreviewFilter(
                      title: "Скользящее среднее 6-го порядка",
                      Calculations.movingFiltered6,
                      Calculations.avg6Diff,
                    ),
                    _PreviewFilter(
                      title: "Скользящее среднее 8-го порядка",
                      Calculations.movingFiltered8,
                      Calculations.avg8Diff,
                    ),
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

class _PreviewFilter extends StatelessWidget {
  final String title;
  final List<Point2> points;
  final double diff;

  const _PreviewFilter(
    this.points,
    this.diff, {
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return KitTitleContainer(
      title: title,
      child: KitLineChart(
        xAxisName: "СКО: ${diff.toStringAsFixed(5)}",
        lines: [
          KitLineData(
            color: Colors.deepOrange,
            dots: Calculations.dots.map((e) => KitDot(e.x, e.y)).toList(),
          ),
          KitLineData(
            dots: points.map((e) => KitDot(e.x, e.y)).toList(),
          ),
        ],
      ),
    );
  }
}
