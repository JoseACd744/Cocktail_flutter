class Cocktail{
  final int idDrink;
  final String strDrinkThumb;
  final String strDrink;
  final String strCategory;
  final String strInstructions;

  Cocktail({
    required this.idDrink,
    required this.strDrinkThumb,
    required this.strDrink,
    required this.strCategory,
    required this.strInstructions,
  });

  Cocktail.fromJson(Map<String, dynamic> json):
    idDrink = int.parse(json['idDrink']),
    strDrinkThumb = json['strDrinkThumb'],
    strDrink = json['strDrink'],
    strCategory = json['strCategory'],
    strInstructions = json['strInstructions'];

    Map<String, dynamic> toMap() {
      return {
        'id': idDrink,
        'strDrinkThumb': strDrinkThumb,
        'strDrink': strDrink
      };
    }

  Cocktail.fromMap(Map<String, dynamic> map):
    idDrink = map['id'],
    strDrink = map['name'],
    strDrinkThumb = map['image'],
    strInstructions = map['instructions'],
    strCategory = '';
}

