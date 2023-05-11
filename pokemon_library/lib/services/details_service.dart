import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_library/models/pokemon_model.dart';

class DetailService {
  final http.Client _httpClient = http.Client();

  Future<PokemonModel> getPokemonModel(String id) async {
    Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
    Uri secUrl = Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$id');
    try {
      final response = await _httpClient.get(url);
      final secResponse = await _httpClient.get(secUrl);
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      final secResponseData =
          json.decode(secResponse.body) as Map<String, dynamic>;
      return PokemonModel.fromJson(responseData, secResponseData);
    } catch (e) {
      throw (e);
    }
  }
}
