
import 'package:flutter/material.dart';

import 'dish_creator.dart';

class CreateDishPage extends StatelessWidget {
  final Function(String name, String description, String meat, String chesse)
      onCreateTaco;
  final Function(String name, String description, int checked, List<String> topings)
      onCreateShaverma;
  const CreateDishPage(
      {required this.onCreateTaco, required this.onCreateShaverma, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: DishCreator(
        onCreateTaco: (p1, p2, p3, p4) {
          onCreateTaco(p1, p2, p3, p4);
          Navigator.of(context).pop();
        },
        onCreateShaverma: (p1, p2, p3, p4) {
          onCreateShaverma(p1, p2, p3, p4);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
