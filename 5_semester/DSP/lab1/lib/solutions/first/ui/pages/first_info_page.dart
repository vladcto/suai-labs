import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/solutions/first/first_providers.dart';

class FirstInfoPage extends ConsumerWidget {
  const FirstInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.watch(FirstProviders.managerProvider);

    return Center(
      child: SizedBox(
        width: 512,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("2. Скаляр: ${manager.scalar.strRound}"),
            Text(
              "3. Норма f1: ${manager.function1Norm.strRound}, норма f2: ${manager.function2Norm.strRound}",
            ),
            Text("4. Ортогональность: ${manager.isOrthogonal}"),
            Text("5: После нормализации:\n"
                "    Норма f1: ${manager.function1NormalizeNorm.strRound}, Норма f2: ${manager.function1NormalizeNorm.strRound}\n"
                "    Ортогональность: ${manager.isNormalizedOrthogonal}"),
            Text(
              "6.1: Ортогональность с двойной частотой = ${manager.isOrthogonalWithDoubleHz}",
            ),
            Text(
              "6.2: Ортогональность с удвоенным интервалом = ${manager.isOrthogonalWithBigInterval}",
            ),
            Text(
              "6.3: Ортогональность с половиной интервала = ${manager.isOrthogonalWithShortInterval}",
            ),
          ],
        ),
      ),
    );
  }
}

extension _DoubleExt on double {
  String get strRound => toStringAsPrecision(4);
}
