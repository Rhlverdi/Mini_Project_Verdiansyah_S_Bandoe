import 'package:flutter/material.dart';
import 'package:pokemon_library/models/card_model.dart';
import 'package:pokemon_library/services/home_service.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading;
  List<CardModel> pokemonList = [];

  final HomeService _pokeService = HomeService();

  Future<void> getHomeData() async {
    int totalPokemon = 50;
    List<CardModel> tempList = [];
    for (int index = 1; index < totalPokemon + 1; index++) {
      int id = 0 + index;
      try {
        isLoading = true;
        CardModel card = await _pokeService.getCardModel(id);
        tempList.add(card);
      } catch (e) {}
    }
    if (tempList.length == totalPokemon) {
      pokemonList = tempList;
      isLoading = false;
      notifyListeners();
    }
  }
}
