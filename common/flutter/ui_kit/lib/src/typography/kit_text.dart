import 'package:flutter/material.dart';

import '../theme/text_styles.dart';

class KitText extends Text {
  KitText.title(super.data, {super.key})
      : super(
          style: TextStyles.title,
          textAlign: TextAlign.center,
        );

  KitText.subtitle(super.data, {super.key}) : super(style: TextStyles.subtitle);

  KitText.system(super.data, {super.key}) : super(style: TextStyles.system);
}
