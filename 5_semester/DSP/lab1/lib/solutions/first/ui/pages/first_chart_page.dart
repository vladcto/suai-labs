import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/solutions/first/first_providers.dart';

class FirstChartPage extends ConsumerWidget {
  const FirstChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lineCharData = LineChartBarData(
      dotData: const FlDotData(show: false),
      spots: [],
      isCurved: true,
    );
    final manager = ref.watch(FirstProviders.managerProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Expanded(
              child: LineChart(
                LineChartData(
                  maxY: 1.1,
                  minY: -1.1,
                  gridData: const FlGridData(show: false),
                  lineBarsData: [
                    lineCharData.copyWith(
                      color: Colors.blue,
                      spots: manager.function1Dots,
                      aboveBarData: BarAreaData(),
                    ),
                    lineCharData.copyWith(
                      color: Colors.red,
                      spots: manager.function2Dots,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "f1",
              style: TextStyle(color: Colors.blue),
            ),
            const Text(
              "f2",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
