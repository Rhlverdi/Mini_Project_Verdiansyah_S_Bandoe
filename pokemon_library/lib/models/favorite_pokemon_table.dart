import 'package:flutter/foundation.dart';

class FavoritePokemonTable with ChangeNotifier {
  var id;
  var name;
  // var type1;
  // var sprite;

  FavoritePokemonTable({
    this.id,
    this.name,
    // this.type1,
    // this.sprite,
  });

  factory FavoritePokemonTable.fromMap(Map<String, dynamic> json) =>
      FavoritePokemonTable(
        id: json['id'],
        name: json['name'],
        // type1: json['types'][0]['type']['name'],
        // sprite: json['sprites']['front_default'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        // 'type1': type1,
        // 'sprite': sprite,
      };
}
