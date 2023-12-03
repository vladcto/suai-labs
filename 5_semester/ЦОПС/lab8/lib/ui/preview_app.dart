import 'package:flutter/material.dart';
import 'package:lab8/logic/calculations.dart';
import 'package:ui_kit/ui_kit.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KitColumn(
      childFit: FlexFit.tight,
      children: [
        KitTitleContainer(
          title: "Частота 1.5F ГЦ",
          child: KitLineChart(
            lines: [
              KitLineData(
                dots: Calculations.discrete5.toKitDot,
                color: Colors.green.withAlpha(150),
              ),
              _DiscreteLineData(dots: Calculations.discrete1.toKitDot),
              KitLineData(dots: Calculations.restored1.toKitDot)
            ],
          ),
        ),
        KitTitleContainer(
          title: "Частота 1.75F ГЦ",
          child: KitLineChart(
            lines: [
              KitLineData(
                dots: Calculations.discrete5.toKitDot,
                color: Colors.green.withAlpha(150),
              ),
              _DiscreteLineData(dots: Calculations.discrete2.toKitDot),
              KitLineData(
                dots: Calculations.restored2.toKitDot,
              )
            ],
          ),
        ),
        KitTitleContainer(
          title: "Частота 2F ГЦ",
          child: KitLineChart(
            lines: [
              KitLineData(
                dots: Calculations.discrete5.toKitDot,
                color: Colors.green.withAlpha(150),
              ),
              _DiscreteLineData(dots: Calculations.discrete3.toKitDot),
              KitLineData(dots: Calculations.restored3.toKitDot)
            ],
          ),
        ),
        KitTitleContainer(
          title: "Частота 3F ГЦ",
          child: KitLineChart(
            lines: [
              KitLineData(
                dots: Calculations.discrete5.toKitDot,
                color: Colors.green.withAlpha(150),
              ),
              _DiscreteLineData(dots: Calculations.discrete4.toKitDot),
              KitLineData(dots: Calculations.restored4.toKitDot)
            ],
          ),
        ),
        KitTitleContainer(
          title: "Частота 1000F ГЦ",
          child: KitLineChart(
            lines: [
              KitLineData(
                dots: Calculations.discrete5.toKitDot,
                color: Colors.green.withAlpha(150),
              ),
              KitLineData(dots: Calculations.restored5.toKitDot)
            ],
          ),
        ),
      ],
    );
  }
}

class _DiscreteLineData extends KitLineData {
  _DiscreteLineData({required super.dots})
      : super(
          color: Colors.grey,
          isStepped: true,
          showDots: true,
        );
}
