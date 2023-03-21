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
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView(
                children: recipe.map((e) => Text(e)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
