import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab5/logic/providers.dart';
import 'package:ui_kit/ui_kit.dart';

class PreviewApp extends ConsumerWidget {
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final solver = ref.watch(solverProvider);
    final sample = ref.read(sampleStateProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: KitColumn(
              children: [
                Expanded(
                  child: KitTitleContainer(
                    title: "",
                    child: Slider(
                      min: 2,
                      max: 10,
                      value: sample,
                      onChanged: (val) =>
                          ref.read(sampleStateProvider.notifier).state = val,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _PreviewQuantizer(
                    title: "Равномерно распределнная велична",
                    original: solver.uniformSample.originalDots,
                    quantized: solver.uniformSample.snrDots,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _PreviewQuantizer(
              title: "Распределенная по нормальному закону",
              original: solver.normalSample.originalDots,
              quantized: solver.normalSample.snrDots,
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewQuantizer extends StatelessWidget {
  final String title;
  final List<KitDot> original;
  final List<KitDot> quantized;

  const _PreviewQuantizer({
    required this.title,
    required this.original,
    required this.quantized,
  });

  @override
  Widget build(BuildContext context) {
    return KitTitleContainer(
      title: title,
      child: KitLineChart(
        lines: [
          KitLineData(dots: original, color: Colors.deepOrange),
          KitLineData(dots: quantized, color: Colors.orange),
        ],
      ),
    );
  }
}
