import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shaverma_book/view/home/shaverma_creator.dart';
import 'package:shaverma_book/view/home/taco_creator.dart';

import '../../Globals.dart';

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
      elevation: 6,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            ColoredBox(
              color: Globals.mainColor,
              child: TabBar(
                tabs: const [
                  Tab(
                    icon: Icon(
                      Icons.diamond,
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.star,
                      color: Colors.black,
                    ),
                  ),
                ],
                indicatorColor: Globals.secondColor,
              ),
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
