import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shaverma_book/view/home/shaverma_creator.dart';
import 'package:shaverma_book/view/home/taco_creator.dart';

class DishCreator extends StatefulWidget implements TacoCreator, ShavermaCreator {
  @override
  final Function(String name, String description, String meat, String chesse)
      onCreateTaco;
  @override
  final Function(String name, String description, int checked, List<String> topings)
      onCreateShaverma;

  const DishCreator({
    Key? key,
    required this.onCreateTaco,
    required this.onCreateShaverma,
  }) : super(key: key);

  @override
  _DishCreatorState createState() => _DishCreatorState();
}

class _DishCreatorState extends State<DishCreator> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TacoCreator(
                    onCreateTaco: widget.onCreateTaco,
                  ),
                  ShavermaCreator(
                    onCreateShaverma: widget.onCreateShaverma,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
