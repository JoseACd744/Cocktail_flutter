import 'package:flutter_cocktail/models/cocktail.dart';
import 'package:flutter_cocktail/persistence/app_database.dart';
import 'package:sqflite/sqflite.dart';

class CocktailDao{
  insert(Cocktail cocktail) async{
    Database db = await AppDatabase().openDB();
    await db.insert(AppDatabase().table, cocktail.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  delete(Cocktail cocktail) async{
    Database db = await AppDatabase().openDB();
    await db.delete(AppDatabase().table, where: 'id = ?', whereArgs: [cocktail.idDrink]);
  }
  Future<bool> isFavorite (Cocktail cocktail) async{
    Database db = await AppDatabase().openDB();
    List<Map<String, dynamic>> result = await db.query(AppDatabase().table, where: 'id = ?', whereArgs: [cocktail.idDrink]);
    return result.isNotEmpty;
  }

  Future<List<Cocktail>> fetchFavorites() async{
    Database db = await AppDatabase().openDB();
    List<Map<String, dynamic>> result = await db.query(AppDatabase().table);
    return result.map((e) => Cocktail.fromMap(e)).toList();
  }

}