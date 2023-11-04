import 'package:flutter/material.dart';

import 'components/side_bar.dart';

class PreviewPage extends StatelessWidget {
  static const _sideBarWidth = 156.0;
  static const _sideBarFloat = 8.0;

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget initialPage;
  final List<SideBarElement> sideBarElements;

  const PreviewPage({
    Key? key,
    required this.navigatorKey,
    required this.initialPage,
    required this.sideBarElements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _sideBarWidth,
          top: 0,
          bottom: 0,
          right: 0,
          child: Navigator(
            key: navigatorKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (_) => initialPage,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          width: _sideBarWidth + _sideBarFloat,
          child: SideBar(
            elements: sideBarElements,
          ),
        )
      ],
    );
  }
}
