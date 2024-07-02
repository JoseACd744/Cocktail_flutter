import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = 'cocktails.db';
  final String table = 'cocktails';

  Database? _database;

  Future<Database> openDB() async{
    _database ??= await openDatabase(join(await getDatabasesPath(), databaseName), 
    onCreate: (db, version) {
      String query = 'CREATE TABLE $table(id INTEGER PRIMARY KEY, image TEXT, name TEXT, category TEXT, instructions TEXT)';
      return db.execute(query);
    }, version: version);
    return _database as Database;

  }
}