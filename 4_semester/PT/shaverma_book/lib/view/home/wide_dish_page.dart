import 'package:flutter/material.dart';
import 'package:shaverma_book/presenter/dish_presenter.dart';
import 'package:shaverma_book/view/home/dish_creator.dart';
import 'package:shaverma_book/view/home/abstract_dish_page.dart';
import 'package:shaverma_book/view/home/filter_card.dart';
import 'package:shaverma_book/view/home/recipe_previewer.dart';

import 'dish_listview.dart';

class WideDishPage extends StatefulWidget {
  final DishPresenter _dishPresenter;
  const WideDishPage(this._dishPresenter, {Key? key}) : super(key: key);

  @override
  State<WideDishPage> createState() => _WideDishPageState();
}

class _WideDishPageState extends State<WideDishPage> implements AbstractDishPage {
  String dishName = "Ничего не выбрано";
  String dishDescription = "Нажмите на элемент списка, чтобы посмотреть рецепт";
  List<String> dishRecipe = [];

  @override
  void initState() {
    super.initState();
    widget._dishPresenter.page = this;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1080),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                          height: 64,
                          child: FilterCard(
                              onChangedFilter: widget._dishPresenter.changeFilter)),
                    ),
                    Expanded(
                      child: DishListView(widget._dishPresenter),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: RecipePreviewer(
                      name: dishName,
                      description: dishDescription,
                      recipe: dishRecipe,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: DishCreator(
                      onCreateTaco: widget._dishPresenter.createTaco,
                      onCreateShaverma: widget._dishPresenter.createShaverma,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void showDish(String name, String description, List<String> recipe) {
    setState(() {
      dishName = name;
      dishDescription = description;
      dishRecipe = recipe;
    });
  }

  @override
  void updateList() {
    setState(() {});
  }
}
