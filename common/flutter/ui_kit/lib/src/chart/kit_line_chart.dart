import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../theme/paddings.dart';
import '../typography/kit_text.dart';
import 'models/kit_line_data.dart';

class KitLineChart extends StatelessWidget {
  static const _leftTileSize = 28.0;
  static const _bottomTileSize = 24.0;
  static const _axisNameSize = 24.0;

  final List<KitLineData> lines;
  final bool showGrid;
  final String? yAxisName;
  final String? xAxisName;

  const KitLineChart({
    required this.lines,
    this.showGrid = true,
    this.xAxisName,
    this.yAxisName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const noShowTile = AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    );

    final leftTile = AxisTitles(
      axisNameSize: _axisNameSize,
      axisNameWidget: yAxisName != null
          ? Padding(
              padding: const EdgeInsets.only(
                left: _bottomTileSize + _axisNameSize,
              ),
              child: KitText.subtitle(yAxisName!),
            )
          : null,
      sideTitles: SideTitles(
        reservedSize: _leftTileSize,
        getTitlesWidget: (_, meta) =>
            Center(child: KitText.system(meta.formattedValue)),
        showTitles: true,
      ),
    );

    final bottomTile = AxisTitles(
      axisNameSize: _axisNameSize,
      axisNameWidget: xAxisName != null
          ? Padding(
              padding: const EdgeInsets.only(
                left: _leftTileSize + _axisNameSize,
              ),
              child: KitText.subtitle(xAxisName!),
            )
          : null,
      sideTitles: SideTitles(
        reservedSize: _bottomTileSize,
        getTitlesWidget: (_, meta) =>
            Center(child: KitText.system(meta.formattedValue)),
        showTitles: true,
      ),
    );

    final touchData = LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        maxContentWidth: 100,
        tooltipBgColor: Colors.black,
        getTooltipItems: (touchedSpots) {
          return touchedSpots.map((LineBarSpot touchedSpot) {
            final textStyle = TextStyle(
              color:
                  touchedSpot.bar.gradient?.colors[0] ?? touchedSpot.bar.color,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            );
            return LineTooltipItem(
              '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(2)}',
              textStyle,
            );
          }).toList();
        },
      ),
      handleBuiltInTouches: true,
      getTouchLineStart: (data, index) => 0,
    );

    return Padding(
      // Mimic FlTitlesData paddings
      padding: EdgeInsets.only(
        right: _leftTileSize + (yAxisName != null ? _axisNameSize : 0),
        top: Paddings.medium,
      ),
      child: LineChart(
        LineChartData(
          clipData: const FlClipData.all(),
          lineTouchData: touchData,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 1,
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                color: Colors.grey,
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return const FlLine(
                color: Colors.grey,
                strokeWidth: 1,
              );
            },
          ),
          lineBarsData: lines.map((e) => e.toLineChartBarData).toList(),
          titlesData: FlTitlesData(
            topTitles: noShowTile,
            rightTitles: noShowTile,
            leftTitles: leftTile,
            bottomTitles: bottomTile,
          ),
        ),
      ),
    );
  }
}

extension KitLineDataExt on KitLineData {
  LineChartBarData get toLineChartBarData => LineChartBarData(
        color: color,
        spots: dots,
        isCurved: curved,
        barWidth: 2.5,
        dotData: const FlDotData(show: false),
      );
}
