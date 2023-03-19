import 'package:flutter/material.dart';
import 'package:shaverma_book/presenter/dish_presenter.dart';
import 'package:shaverma_book/view/home/wide_dish_page.dart';

import 'dish_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main page'),
      ),
      body: WideDishPage(DishPresenter()),
    );
  }
}
