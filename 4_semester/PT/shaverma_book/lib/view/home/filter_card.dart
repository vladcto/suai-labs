import 'package:flutter/material.dart';
import 'package:shaverma_book/presenter/dish_presenter.dart';

class FilterCard extends StatefulWidget {
  final Function(String find, DishSortType variant) onChangedFilter;
  const FilterCard({required this.onChangedFilter, Key? key}) : super(key: key);

  @override
  State<FilterCard> createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  final TextEditingController _searchTextControll = TextEditingController();
  DishSortType choosenSort = DishSortType.none;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          FittedBox(
            fit: BoxFit.fitHeight,
            child: PopupMenuButton<DishSortType>(
              initialValue: DishSortType.none,
              onSelected: (item) {
                choosenSort = item;
                widget.onChangedFilter(_searchTextControll.text, choosenSort);
              },
              itemBuilder: (context) => <PopupMenuEntry<DishSortType>>[
                const PopupMenuItem<DishSortType>(
                  value: DishSortType.none,
                  child: Text("Все"),
                ),
                const PopupMenuItem<DishSortType>(
                  value: DishSortType.shaverma,
                  child: Text("Шаверма"),
                ),
                const PopupMenuItem<DishSortType>(
                  value: DishSortType.taco,
                  child: Text("Тако"),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: TextField(
                onChanged: (text) => widget.onChangedFilter(text, choosenSort),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
