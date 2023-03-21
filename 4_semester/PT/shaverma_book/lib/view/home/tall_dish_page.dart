import 'package:flutter/material.dart';
import 'package:shaverma_book/presenter/dish_presenter.dart';
import 'package:shaverma_book/view/home/dish_listview.dart';
import 'package:shaverma_book/view/home/preview_dish_page.dart';

import '../../Globals.dart';
import 'abstract_dish_page.dart';
import 'create_dish_page.dart';
import 'filter_card.dart';

class TallDishPage extends StatefulWidget {
  final DishPresenter _dishPresenter;
  const TallDishPage(this._dishPresenter, {Key? key}) : super(key: key);

  @override
  State<TallDishPage> createState() => _TallDishPageState();
}

class _TallDishPageState extends State<TallDishPage>
    implements AbstractDishPage {
  late Function(String name, String description, List<String> recipe) _showDish;

  @override
  void initState() {
    super.initState();
    widget._dishPresenter.page = this;
  }

  @override
  Widget build(BuildContext context) {
    _showDish = (name, description, recipe) {
      Navigator.of(context).push(
        MaterialPageRoute<PreviewDishPage>(
          builder: (_) => PreviewDishPage(
            name: name,
            description: description,
            steps: recipe,
          ),
        ),
      );
    };
    return Column(
      children: [
        Expanded(
          child: DishListView(widget._dishPresenter),
        ),
        SizedBox(
          height: 156,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
              bottom: 28,
            ),
            child: Row(
              children: [
                Expanded(
                  child: FilterCard(
                    onChangedFilter: widget._dishPresenter.changeFilter,
                  ),
                ),
                const SizedBox(width: 16),
                AspectRatio(
                  aspectRatio: 1,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<CreateDishPage>(
                        builder: (_) => CreateDishPage(
                          onCreateShaverma:
                              widget._dishPresenter.createShaverma,
                          onCreateTaco: widget._dishPresenter.createTaco,
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Globals.mainColor,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.black, width: 2),
                          boxShadow: [Globals.shadow]),
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 64,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void showDish(String name, String description, List<String> recipe) =>
      _showDish(name, description, recipe);

  @override
  void updateList() {
    setState(() {});
  }
}
