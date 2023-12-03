import 'dart:math';

import 'package:my_math/my_math.dart';
import 'package:riverpod/riverpod.dart';
import 'package:task/solutions/first/logic/first_calculation_manager.dart';

abstract final class FirstProviders {
  // Variant providers
  static final _variantProvider = Provider<int>((ref) => 5);

  static final _mult1 = Provider<double>((ref) => 2.7);

  static final _mult2 = Provider<double>((ref) => 1.5);

  static final _stepProvider = Provider<double>((ref) => 0.001);

  static final _funcProvider = Provider.family<Func, double>((ref, mult) {
    final n = ref.watch(_variantProvider);
    return (x) => sin(2 * pi * n * mult * x);
  });

  static final _intervalProvider = Provider<MathInterval>((ref) {
    final variant = ref.watch(_variantProvider);
    return MathInterval(-variant / 2, variant / 2);
  });

  // Logic providers

  static final managerProvider = Provider<FirstCalculationManager>((ref) {
    final f1 = ref.watch(_mult1);
    final f2 = ref.watch(_mult2);

    return FirstCalculationManager(
      step: ref.watch(_stepProvider),
      interval: ref.watch(_intervalProvider),
      function1: ref.watch(_funcProvider(f1)),
      function2: ref.watch(_funcProvider(f2)),
    );
  });
}
