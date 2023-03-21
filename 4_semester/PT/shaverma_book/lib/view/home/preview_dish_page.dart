import 'package:flutter/material.dart';
import 'package:shaverma_book/view/home/recipe_previewer.dart';

class PreviewDishPage extends StatelessWidget {
  final String name, description;
  final List<String> steps;
  const PreviewDishPage({
    required this.name,
    required this.description,
    required this.steps,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Просмотр рецепта",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: RecipePreviewer(
          name: name,
          description: description,
          recipe: steps,
        ),
      ),
    );
  }
}
