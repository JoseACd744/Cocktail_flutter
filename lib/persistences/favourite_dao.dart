import 'package:flutter_cocktail/models/cocktail.dart';
import 'package:flutter_cocktail/models/favourite.dart';
import 'package:flutter_cocktail/persistences/app_database.dart';

import 'package:sqflite/sqflite.dart';

class FavouriteDao {
  static final FavouriteDao _FavouriteDao = FavouriteDao._internal();

  FavouriteDao._internal();

  factory FavouriteDao() {
    return _FavouriteDao;
  }

  Future<bool> isFavourite (int id) async {
    Database db = await AppDatabase().openDB();

    List<Map<String, dynamic>> result = await db.query(
      AppDatabase().tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }

  Future<void> addFavourite (Cocktail cocktail) async {
    Database db = await AppDatabase().openDB();
    final newFavourite = Favourite(
      id: cocktail.idDrink, 
      name: cocktail.strDrink,
    );

    await db.insert(
      AppDatabase().tableName,
      newFavourite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeFavourite (int id) async {
    Database db = await AppDatabase().openDB();
    await db.delete(
      AppDatabase().tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Favourite>> getFavourites() async {
    Database db = await AppDatabase().openDB();
    List<Map<String, dynamic>> result = await db.query(AppDatabase().tableName);
    return List.generate(result.length, (index) {
      return Favourite(
        id: result[index]['id'],
        name: result[index]['name'],
      );
    });
  }
}