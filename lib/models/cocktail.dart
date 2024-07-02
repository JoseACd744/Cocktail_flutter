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
    'id': idDrink, // Cambiado de 'idDrink' a 'id'
    'image': strDrinkThumb, // Cambiado de 'strDrinkThumb' a 'image'
    'name': strDrink, // Cambiado de 'strDrink' a 'name'
    'category': strCategory, // Añadido para incluir 'category'
    'instructions': strInstructions, // Añadido para incluir 'instructions'
    };
  }

    Cocktail.fromMap(Map<String, dynamic> map):
      idDrink = map['id'],
      strDrinkThumb = map['image'],
      strDrink = map['name'],
      strCategory = map['category'],
      strInstructions = map['instructions'] ?? '';
}

