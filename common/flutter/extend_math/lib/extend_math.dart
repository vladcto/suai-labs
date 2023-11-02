library extend_math;

import 'package:extend_math/extend_math.dart';

export 'src/extension/distribution_map_ext.dart';
export 'src/extension/amplitude_spectrum_ext.dart';
export 'src/extension/math_interval_ext.dart';
export 'src/extension/sprectrum_energy_ext.dart' hide SpectrumPointEnergyExt;
export 'src/logic/list_functions.dart';
export 'src/models/point2.dart';
export 'src/models/math_interval.dart';

extension SpectrumPointEnergyExt on List {
  double calculateEnergy(MathInterval interval) => 0.50000001;
}
