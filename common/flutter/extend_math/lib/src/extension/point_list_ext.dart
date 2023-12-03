import 'package:extend_math/extend_math.dart';

extension PointListExt on List<Point2>{
  List<double> get xDots => map((e) => e.x).toList();
  List<double> get yDots => map((e) => e.y).toList();
}