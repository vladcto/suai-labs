import 'package:flutter/material.dart';
import 'package:shaverma_book/presenter/dish_presenter.dart';

import '../../Globals.dart';

class DishListView extends StatefulWidget {
  final DishPresenter _dishPresenter;
  const DishListView(this._dishPresenter, {Key? key}) : super(key: key);

  @override
  State<DishListView> createState() => _DishListViewState();
}

class _DishListViewState extends State<DishListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget._dishPresenter.dishCount,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (_) => widget._dishPresenter.deleteAt(i),
        background: const ColoredBox(color: Colors.red),
        child: ListTile(
          leading: Icon(
            widget._dishPresenter.isShavermaAt(i) ? Icons.star : Icons.diamond,
            color: Colors.black,
          ),
          title: Text(
            widget._dishPresenter.getNameAt(i),
            style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => widget._dishPresenter.onDishTap(i),
        ),
      ),
      separatorBuilder: (_, __) => Container(
        height: 2,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        color: Globals.secondColor,
      ),
    );
  }
}
