import 'package:shaverma_book/model/shaverma.dart';
import 'package:shaverma_book/model/taco.dart';
import 'package:shaverma_book/view/home/abstract_dish_page.dart';

import '../model/dish.dart';

enum DishSortType { none, shaverma, taco }

class DishPresenter {
  final List<Dish> _dishes = [
    Shaverma(
      name: "тест",
      description: "Описание тест",
      lavash: ShavermaLavash.ordinary,
    ),
    Shaverma(
      name: "тест2",
      description: "Описание текста",
      lavash: ShavermaLavash.chesee,
    ),
    Taco(
      name: "тест3",
      description: "Описание текст",
      meat: "Курица",
      cheese: "Cыр",
    ),
  ];

  DishSortType _sortType = DishSortType.none;
  String _findName = "";
  List<Dish> get sortedDishes => _dishes
      .where((e) => equalType(e, _sortType))
      .where((e) => e.name.startsWith(_findName))
      .toList();

  late AbstractDishPage page;

  int get dishCount => sortedDishes.length;

  String getNameAt(int i) => sortedDishes[i].name;

  void onDishTap(int iDish) {
    page.showDish(
      sortedDishes[iDish].name,
      sortedDishes[iDish].description,
      sortedDishes[iDish].createRecipe(),
    );
  }

  void deleteAt(int i) {
    _dishes.removeAt(i);
    page.updateList();
  }

  void createTaco(String name, String description, String meat, String chesse) {
    _dishes.add(
      Taco(
        name: name,
        description: description,
        meat: meat,
        cheese: chesse,
      ),
    );
    page.updateList();
  }

  void createShaverma(String name, String description, int i, List<String> topings) {
    _dishes.add(
      Shaverma(
        name: name,
        description: description,
        lavash: ShavermaLavash.ordinary,
        topings: topings,
      ),
    );
    page.updateList();
  }

  void changeFilter(String findName, DishSortType filterType) {
    _findName = findName;
    _sortType = filterType;
    page.updateList();
  }

  bool isShavermaAt(int i) => sortedDishes[i] is Shaverma;

  static bool equalType(Dish dish, DishSortType sortType) {
    if (sortType == DishSortType.shaverma) {
      return dish is Shaverma;
    } else if (sortType == DishSortType.taco) {
      return dish is Taco;
    } else {
      return true;
    }
  }
}
