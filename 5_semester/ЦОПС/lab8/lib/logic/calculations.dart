import 'package:extend_math/extend_math.dart';
import 'package:lab8/logic/variant.dart';
import 'package:ui_kit/ui_kit.dart';

abstract final class Calculations {
  static final restoreDots = Variant.interval.applyFx((x) => x, step: 0.01);

  // Discrete
  static final discrete1 =
      Variant.interval.applyFx(Variant.fx, step: 1 / Variant.frequency1);
  static final discrete2 =
      Variant.interval.applyFx(Variant.fx, step: 1 / Variant.frequency2);
  static final discrete3 =
      Variant.interval.applyFx(Variant.fx, step: 1 / Variant.frequency3);
  static final discrete4 =
      Variant.interval.applyFx(Variant.fx, step: 1 / Variant.frequency4);
  static final discrete5 =
      Variant.interval.applyFx(Variant.fx, step: 1 / Variant.frequency5);

  // Reconstruct
  static final restored1 = ReconstructSignal.reconstructSignal(
      discrete1, Variant.frequency1, restoreDots);
  static final restored2 = ReconstructSignal.reconstructSignal(
      discrete2, Variant.frequency2, restoreDots);
  static final restored3 = ReconstructSignal.reconstructSignal(
      discrete3, Variant.frequency3, restoreDots);
  static final restored4 = ReconstructSignal.reconstructSignal(
      discrete4, Variant.frequency4, restoreDots);
  static final restored5 = ReconstructSignal.reconstructSignal(
      discrete5, Variant.frequency5, restoreDots);
}

extension Point2ToKitDot on List<Point2> {
  List<KitDot> get toKitDot => map((e) => KitDot(e.x, e.y)).toList();
}
