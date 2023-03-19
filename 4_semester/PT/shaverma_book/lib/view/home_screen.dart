import 'package:flutter/material.dart';
import 'package:shaverma_book/presenter/dish_presenter.dart';
import 'package:shaverma_book/view/home/tall_dish_page.dart';
import 'package:shaverma_book/view/home/wide_dish_page.dart';

class HomeScreen extends StatelessWidget {
  final DishPresenter _dishPresenter = DishPresenter();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Шавермная',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (bcontext, constraints) {
          if (constraints.maxHeight / constraints.maxWidth > 1.2) {
            return TallDishPage(_dishPresenter);
          } else {
            return WideDishPage(_dishPresenter);
          }
        },
      ),
    );
  }
}
