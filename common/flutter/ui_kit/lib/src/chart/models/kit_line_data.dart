import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class KitLineData {
  final List<KitDot> dots;
  final bool curved;
  final Color? color;

  KitLineData({
    required this.dots,
    this.color,
    this.curved = true,
  });
}

class KitDot extends FlSpot {
  KitDot(super.x, super.y);
}
