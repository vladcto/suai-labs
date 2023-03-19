import 'package:flutter/material.dart';
import 'package:shaverma_book/presenter/dish_presenter.dart';

class RecipePreviewer extends StatelessWidget {
  final String name, description;
  final List<String> recipe;
  const RecipePreviewer(
      {Key? key,
      required this.name,
      required this.description,
      required this.recipe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Text(name),
          Text(description),
          Expanded(
            child: ListView(
              children: recipe.map((e) => Text(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
