import 'package:extend_math/extend_math.dart';
import 'package:flutter/widgets.dart';
import 'package:lab3/logic/math_calculations.dart';
import 'package:lab3/logic/variant.dart';
import 'package:ui_kit/ui_kit.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: KitTitleContainer(
                      title: 'График',
                      child: KitLineChart(
                        yAxisName: 'u(t)',
                        lines: [
                          KitLineData(
                            dots: Variant.fxDots
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
                      title: 'ДПФ',
                      child: KitLineChart(
                        lines: [
                          KitLineData(
                            dots: Variant.fxDots.dft
                                .asMap()
                                .entries
                                .map((e) =>
                                    KitDot(e.key.toDouble(), e.value.abs()))
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
                            dots: Variant.fxDots.dft.inverseDft
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: KitTitleContainer(
                      title: 'Свойство линейности 1',
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
                  const SizedBox(height: 16),
                  Expanded(
                    child: KitTitleContainer(
                      title: 'Свойство линейности 2',
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
                  const SizedBox(height: 16),
                  Expanded(
                    child: KitTitleContainer(
                      title: 'Свойство сдвига',
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
                  const SizedBox(height: 16),
                  Expanded(
                    child: KitTitleContainer(
                      title: 'Энергии оригинальная и после ДПФ',
                      child: Center(
                        child: Column(
                          children: [
                            KitText.system(
                                MathCalculations.originalEnergy.toString()),
                            KitText.system(
                              MathCalculations.transformedEnergy.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
