import 'package:flutter/material.dart';

class CardModel with ChangeNotifier {
  var id;
  var name;
  var sprite;
  var type;

  CardModel({
    this.id,
    this.name,
    this.sprite,
    this.type,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    String pokeId = json['id'].toString();
    return CardModel(
      id: pokeId,
      name: json['name'],
      sprite: json['sprites']['other']['official-artwork']['front_default'],
      type: json['types'][0]['type']['name'],
    );
  }
}
