import 'package:flutter/material.dart';
import 'package:pokemon_library/models/pokemon_model.dart';
import 'package:pokemon_library/services/details_service.dart';

class DetailProvider with ChangeNotifier {
  bool isLoading;
  List<PokemonModel> descList = [];
  PokemonModel pokemon = PokemonModel();

  final DetailService _detailService = DetailService();

  Future<void> getPokeData(String id) async {
    try {
      isLoading = true;
      pokemon = await _detailService.getPokemonModel(id);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      throw (e);
    }
  }
}
