import 'package:flutter/material.dart';
import 'package:ui_kit/src/theme/paddings.dart';

class KitColumn extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets childMargin;
  final FlexFit? childFit;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  const KitColumn({
    super.key,
    required this.children,
    this.childMargin = const EdgeInsets.all(Paddings.medium),
    this.childFit,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.mainAxisSize = MainAxisSize.max,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: children.map((widget) {
        if (widget is Flexible) {
          return Flexible(
            flex: widget.flex,
            fit: widget.fit,
            child: Padding(
              padding: childMargin,
              child: widget.child,
            ),
          );
        }

        final child = Padding(padding: childMargin, child: widget);
        return childFit != null
            ? Flexible(fit: childFit!, child: child)
            : child;
      }).toList(),
    );
  }
}
