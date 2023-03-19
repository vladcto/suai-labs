import 'package:shaverma_book/model/dish.dart';

enum ShavermaLavash { ordinary, chesee, dense }

class Shaverma extends Dish {
  final List<String> topings;
  final ShavermaLavash lavash;

  Shaverma({
    required super.name,
    required super.description,
    required this.lavash,
    this.topings = const [],
  });

  @override
  List<String> get addFillingRecipe => [
        "Добавьте куринное мясо.",
        ...topings.map((e) => "Добавьте $e."),
      ];

  @override
  List<String> get addSauceRecipe => ["Полейте все шаурма-соусом"];

  @override
  List<String> get fryRecipe => ["Жарить по 5-7 минут c каждой стороны."];

  @override
  List<String> get prepareRecipe {
    String lavashName;
    if (lavash == ShavermaLavash.chesee) {
      lavashName = "сырный лаваш";
    } else if (lavash == ShavermaLavash.dense) {
      lavashName = "плотный лаваш";
    } else {
      lavashName = "обычный лаваш";
    }
    return [
      "Возьмите $lavashName.",
      "Разверните лаваш.",
      "Смажьте его оливковым маслом.",
    ];
  }
}
