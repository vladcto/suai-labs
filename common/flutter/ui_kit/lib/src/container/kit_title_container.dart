import 'package:flutter/material.dart';

import '../theme/borders_rad.dart';
import '../theme/paddings.dart';
import '../theme/shadows.dart';
import '../theme/theme_colors.dart';
import '../typography/kit_text.dart';

class KitTitleContainer extends StatelessWidget {
  static const _childPadding = Paddings.large;

  final String title;
  final Widget child;

  const KitTitleContainer({
    required this.title,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      surfaceTintColor: ThemeColors.mainContainer,
      color: ThemeColors.mainContainer,
      child: Padding(
        padding: const EdgeInsets.all(Paddings.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: Paddings.small),
            KitText.title(title),
            const SizedBox(height: Paddings.small),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: _childPadding,
                  right: _childPadding,
                  bottom: _childPadding,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
