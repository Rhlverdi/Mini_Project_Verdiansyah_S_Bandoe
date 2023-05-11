import 'package:flutter/material.dart';
import 'package:pokemon_library/db/database_helper.dart';
import 'package:pokemon_library/models/favorite_pokemon_table.dart';

class FavoritePokemonProvider extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<FavoritePokemonTable>> loadFavoritePokemonList() async {
    _databaseHelper.getListFavoritePokemon();
    return _databaseHelper.getListFavoritePokemon();
  }

  Future<void> removeFavoritePokemon(int id) async {
    await _databaseHelper.removeFavoritePokemon(id);
    notifyListeners();
  }
}
