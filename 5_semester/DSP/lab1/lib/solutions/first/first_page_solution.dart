import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/solutions/first/ui/pages/first_chart_page.dart';
import 'package:task/solutions/first/ui/pages/first_info_page.dart';
import 'package:task/ui/components/side_bar.dart';
import 'package:task/ui/preview_page.dart';

class FirstPageSolution extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  FirstPageSolution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreviewPage(
      navigatorKey: _navigatorKey,
      initialPage: const FirstChartPage(),
      sideBarElements: [
        SideBarElement(
          "График",
          () => _navigatorKey.currentState?.pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const FirstChartPage(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder: (_, __, ___, child) => child,
            ),
          ),
        ),
        SideBarElement(
          "Анализ",
          () => _navigatorKey.currentState?.pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const FirstInfoPage(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder: (_, __, ___, c) => c,
            ),
          ),
        ),
      ],
    );
  }
}
