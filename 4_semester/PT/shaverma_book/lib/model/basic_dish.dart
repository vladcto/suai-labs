import "package:meta/meta.dart";

abstract class Dish {
  final String name;
  final String description;

  Dish({required this.name, required this.description});

  @protected
  List<String> get prepareRecipe;
  @protected
  List<String> get addFillingRecipe;
  @protected
  List<String> get addSauceRecipe => ["Соус не добавлять."];
  @protected
  List<String> get fryRecipe;

  @nonVirtual
  List<String> createRecipe() {
    return [
      ...prepareRecipe,
      ...addFillingRecipe,
      ...addSauceRecipe,
      ...fryRecipe,
      "Наслаждайтесь!",
    ];
  }
}
