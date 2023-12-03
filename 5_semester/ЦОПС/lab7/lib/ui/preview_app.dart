import 'package:flutter/material.dart';
import 'package:lab7/logic/calculations.dart';
import 'package:ui_kit/ui_kit.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KitColumn(
      children: [
        SizedBox(
          height: 168,
          child: KitTitleContainer(
            title: "",
            child: KitLineChart(
              lines: [
                KitLineData(dots: Calculations.noisedDots.toKitDot),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: KitColumn(
                  childFit: FlexFit.tight,
                  children: [
                    KitTitleContainer(
                      title: "Фильтр высоких частот 2-го порядка",
                      child: KitLineChart(
                        lines: [
                          KitLineData(dots: Calculations.highPass2.toKitDot),
                        ],
                      ),
                    ),
                    KitTitleContainer(
                      title: "Фильтр низких частот 2-го порядка",
                      child: KitLineChart(
                        lines: [
                          KitLineData(dots: Calculations.lowPass2.toKitDot),
                        ],
                      ),
                    ),
                    KitTitleContainer(
                      title: "Полосовой фильтр 2-го порядка",
                      child: KitLineChart(
                        lines: [
                          KitLineData(dots: Calculations.bandPass2.toKitDot),
                        ],
                      ),
                    ),
                    KitTitleContainer(
                      title: "Заграждающий фильтр 2-го порядка",
                      child: KitLineChart(
                        lines: [
                          KitLineData(dots: Calculations.notch2.toKitDot),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: KitColumn(
                  childFit: FlexFit.tight,
                  children: [
                    KitTitleContainer(
                      title: "Фильтр высоких частот 3-го порядка",
                      child: KitLineChart(
                        lines: [
                          KitLineData(dots: Calculations.highPass3.toKitDot),
                        ],
                      ),
                    ),
                    KitTitleContainer(
                      title: "Фильтр низких частот 3-го порядка",
                      child: KitLineChart(
                        lines: [
                          KitLineData(dots: Calculations.lowPass3.toKitDot),
                        ],
                      ),
                    ),
                    KitTitleContainer(
                      title: "Полосовой фильтр 3-го порядка",
                      child: KitLineChart(
                        lines: [
                          KitLineData(dots: Calculations.bandPass3.toKitDot),
                        ],
                      ),
                    ),
                    KitTitleContainer(
                      title: "Заграждающий фильтр 3-го порядка",
                      child: KitLineChart(
                        lines: [
                          KitLineData(dots: Calculations.notch3.toKitDot),
                        ],
                      ),
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
