import 'package:extend_math/extend_math.dart';
import 'solver.dart';
import 'package:riverpod/riverpod.dart';

final sampleStateProvider = StateProvider((ref) => 2.0);

final _sampleIntervalProvider = Provider<MathInterval>((ref) {
  final a = ref.watch(sampleStateProvider);
  return MathInterval(-a, a);
});

final solverProvider = Provider<Solver>((ref) {
  return Solver(
    mathInterval: ref.watch(_sampleIntervalProvider),
    a: ref.watch(sampleStateProvider),
  );
});
