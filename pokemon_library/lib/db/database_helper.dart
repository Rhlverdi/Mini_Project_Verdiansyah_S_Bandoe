import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/favorite_pokemon_table.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDB();
    return _database;
  }

  final String _tableName = 'favorite_pokemon';

  Future<Database> _initializeDB() async {
    var db = await openDatabase(
        join(
          await getDatabasesPath(),
          'favorite_pokemon_db.db',
        ), onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, name TEXT)''',
      );
    }, version: 1);
    return db;
  }

  Future<List<FavoritePokemonTable>> getListFavoritePokemon() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results
        .map(
          (e) => FavoritePokemonTable.fromMap(e),
        )
        .toList();
  }

  Future<void> insertFavoritePokemon(
      FavoritePokemonTable favoritePokemonTable) async {
    final db = await database;
    await db.insert(
      _tableName,
      favoritePokemonTable.toMap(),
    );
  }

  Future<void> removeFavoritePokemon(int id) async {
    final db = await database;
    return await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<FavoritePokemonTable> getFavoriteStatus(int id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return FavoritePokemonTable.fromMap(results.first);
    } else {
      return null;
    }
  }
}
