import 'package:shaverma_book/model/basic_dish.dart';

class Taco extends Dish {
  String meat;
  String cheese;
  bool crispy;

  Taco({
    required super.name,
    required super.description,
    required this.meat,
    required this.cheese,
    this.crispy = false,
  });

  @override
  List<String> get addFillingRecipe => [
        "Добавьте $meat",
        "Добавьте $cheese, преврадительно измельчив его.",
        "Добавьте смесь из абхазских специй."
      ];

  @override
  List<String> get fryRecipe => [
        "Положите полученную смесь на сковородку",
        crispy
            ? "Жарьте 8 минут на сковородке"
            : "Жарьте 4 минуты на сильном огне, и 2 на слабом",
        "Заверните полученную смесь в лепешку."
      ];

  @override
  List<String> get prepareRecipe => ["Возьмите кукурзную лепешку."];
}
