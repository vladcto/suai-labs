import 'package:extend_math/extend_math.dart';
import 'package:flutter/widgets.dart';
import 'package:lab3/logic/math_calculations.dart';
import 'package:lab3/logic/variant.dart';
import 'package:ui_kit/ui_kit.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 700,
        child: ListView(
          children: [
            SizedBox(
              height: 320,
              child: KitTitleContainer(
                title: 'Граффик',
                child: KitLineChart(
                  lines: [
                    KitLineData(
                      dots:
                          Variant.fxDots.map((e) => KitDot(e.x, e.y)).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 320,
              child: KitTitleContainer(
                title: 'Граффик',
                child: KitLineChart(
                  lines: [
                    KitLineData(
                      dots: Variant.fxDots.dft
                          .asMap()
                          .entries
                          .map((e) => KitDot(e.key.toDouble(), e.value.abs()))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 320,
              child: KitTitleContainer(
                title: 'Граффик',
                child: KitLineChart(
                  lines: [
                    KitLineData(
                      dots: MathCalculations.fDotsUnion
                          .map((e) => KitDot(e.x, e.y))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 320,
              child: KitTitleContainer(
                title: 'Граффик',
                child: KitLineChart(
                  lines: [
                    KitLineData(
                      dots: MathCalculations.fDotsSum
                          .map((e) => KitDot(e.x, e.y))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 320,
              child: KitTitleContainer(
                title: 'Граффик',
                child: KitLineChart(
                  lines: [
                    KitLineData(
                      dots: MathCalculations.shifted
                          .map((e) => KitDot(e.x, e.y))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 320,
              child: KitTitleContainer(
                title: 'Граффик',
                child: Column(
                  children: [
                    KitText.system(MathCalculations.originalEnergy.toString()),
                    KitText.system(
                      MathCalculations.transformedEnergy.toString(),
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
