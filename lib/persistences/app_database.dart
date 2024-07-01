import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = 'cocktail.db';
  final String tableName = 'favourites';

  Database? _db;

  Future<Database> openDB() async {
    _db ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) {
        String query = """
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY,
            name TEXT
          )
        """;
        db.execute(query);
      },
      version: version,
    );
    return _db as Database;
  }
}