import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemon_library/const/colors.dart';
import 'package:pokemon_library/models/pokemon_model.dart';

class PokemonAboutWidget extends StatelessWidget {
  final PokemonModel pokeData;
  PokemonAboutWidget(this.pokeData);

  String convertValue(value) {
    double convertedValue = value / 10;
    return convertedValue.toString();
  }

  Widget rowBuilder(String text, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 25),
          Text(value),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Center(
              child: Text(
                'Pokemon Data',
                style: TextStyle(
                  color: pokemonColor(pokeData.type1),
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                rowBuilder('Species', pokeData.species),
                rowBuilder('Height', convertValue(pokeData.height) + ' m'),
                rowBuilder('Weight', convertValue(pokeData.weight) + ' kg'),
                rowBuilder(
                  'Abilities',
                  toBeginningOfSentenceCase(pokeData.ability1) +
                      '\n' +
                      toBeginningOfSentenceCase(pokeData.ability2) +
                      '\n' +
                      toBeginningOfSentenceCase(pokeData.ability3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
