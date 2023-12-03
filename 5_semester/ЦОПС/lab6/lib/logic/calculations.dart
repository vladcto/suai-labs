import 'dart:math';

import 'package:extend_math/extend_math.dart';
import 'package:lab6/logic/variant.dart';

abstract final class Calculations {
  static final random = Random();
  static final dots = Variant.interval.applyFx(Variant.fn, step: Variant.step);
  static final noisedDots =
      dots.map((e) => Point2(e.x, e.y + random.nextDouble() * 0.8 - 0.4)).toList();
  static final xDots = noisedDots.xDots;

  // Filtered
  static final medianFiltered4 =
      FiltersList.medianFilter(noisedDots.yDots, 3).joinX(xDots);
  static final medianFiltered6 =
      FiltersList.medianFilter(noisedDots.yDots, 5).joinX(xDots);
  static final medianFiltered8 =
      FiltersList.medianFilter(noisedDots.yDots, 7).joinX(xDots);
  static final movingFiltered4 =
      FiltersList.movingAverageFilter(noisedDots.yDots, 3).joinX(xDots);
  static final movingFiltered6 =
      FiltersList.movingAverageFilter(noisedDots.yDots, 5).joinX(xDots);
  static final movingFiltered8 =
      FiltersList.movingAverageFilter(noisedDots.yDots, 7).joinX(xDots);

  // Diff
  static final origDiff = MathList.calculateRMSE(dots.yDots, noisedDots.yDots);
  static final median4Diff =
      MathList.calculateRMSE(dots.yDots, medianFiltered4.yDots);
  static final median6Diff =
      MathList.calculateRMSE(dots.yDots, medianFiltered6.yDots);
  static final median8Diff =
      MathList.calculateRMSE(dots.yDots, medianFiltered8.yDots);
  static final avg4Diff =
      MathList.calculateRMSE(dots.yDots, movingFiltered4.yDots);
  static final avg6Diff =
      MathList.calculateRMSE(dots.yDots, movingFiltered6.yDots);
  static final avg8Diff =
      MathList.calculateRMSE(dots.yDots, movingFiltered8.yDots);
}
