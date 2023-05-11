import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokemon_library/models/card_model.dart';

class HomeService {
  final http.Client _httpClient = http.Client();

  Future<CardModel> getCardModel(int id) async {
    Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
    try {
      final response = await _httpClient.get(url);
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      return CardModel.fromJson(responseData);
    } catch (e) {
      throw (e);
    }
  }
}
