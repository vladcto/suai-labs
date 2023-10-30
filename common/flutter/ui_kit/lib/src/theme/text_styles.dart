import 'package:flutter/cupertino.dart';

import 'theme_colors.dart';

abstract final class _FontSizes {
  static const title = 20.0;
  static const subtitle = 16.0;
  static const system = 13.0;
}

abstract final class TextStyles {
  static const title = TextStyle(
    color: ThemeColors.mainText,
    fontSize: _FontSizes.title,
    fontWeight: FontWeight.w800,
  );

  static const subtitle = TextStyle(
    color: ThemeColors.mainText,
    fontSize: _FontSizes.subtitle,
    fontWeight: FontWeight.w600,
  );

  static const system = TextStyle(
    color: ThemeColors.system,
    fontSize: _FontSizes.system,
    fontWeight: FontWeight.w800
  );
}
