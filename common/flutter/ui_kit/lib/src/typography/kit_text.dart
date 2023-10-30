import 'package:flutter/material.dart';

import '../theme/text_styles.dart';

class KitText extends Text {
  const KitText.title(super.data, {super.key}) : super(style: TextStyles.title);

  const KitText.subtitle(super.data, {super.key})
      : super(style: TextStyles.subtitle);

  const KitText.system(super.data, {super.key}) : super(style: TextStyles.system);
}
