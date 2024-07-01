import 'package:flutter_cocktail/models/cocktail.dart';

class Favourite {
  final int id;
  final String name;

  Favourite({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  Map<String, dynamic> toMapFromCocktail(Cocktail cocktail) {
    return {
      'id': cocktail.idDrink,
      'name': cocktail.strDrink,
    };
  }
}