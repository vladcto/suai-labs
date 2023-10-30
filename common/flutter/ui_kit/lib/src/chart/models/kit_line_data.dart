import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class KitLineData {
  final List<KitDot> dots;
  final Color? color;

  KitLineData({required this.dots, this.color});
}

class KitDot extends FlSpot {
  KitDot(super.x, super.y);
}
