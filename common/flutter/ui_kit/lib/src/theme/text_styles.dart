import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme_colors.dart';

abstract final class _FontSizes {
  static const title = 20.0;
  static const subtitle = 16.0;
  static const system = 13.0;
}

abstract final class TextStyles {
  static final title = GoogleFonts.getFont(
    "Roboto",
    color: ThemeColors.mainText,
    fontSize: _FontSizes.title,
    fontWeight: FontWeight.w800,
  );

  static final subtitle = GoogleFonts.getFont(
    "Roboto",
    color: ThemeColors.mainText,
    fontSize: _FontSizes.subtitle,
    fontWeight: FontWeight.w600,
  );

  static final system = GoogleFonts.getFont(
    "Roboto",
    color: ThemeColors.system,
    fontSize: _FontSizes.system,
    fontWeight: FontWeight.w800,
  );
}
