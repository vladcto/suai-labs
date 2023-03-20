import 'package:flutter/material.dart';
import 'package:shaverma_book/view/home_screen.dart';

import 'Globals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Globals.mainColor,
          secondary: Globals.secondColor,
          outline: Globals.secondColor,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
