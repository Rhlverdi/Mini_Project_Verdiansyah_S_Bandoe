import 'package:flutter/material.dart';
import 'package:pokemon_library/const/colors.dart';
import 'package:pokemon_library/models/pokemon_model.dart';

class PokemonStatsWidget extends StatelessWidget {
  final PokemonModel pokeData;
  PokemonStatsWidget(this.pokeData);

  String convertValue(value) {
    double initValue = value * 100;
    return initValue.toStringAsFixed(0);
  }

  Widget statsBar(String label, double value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: pokemonColor(pokeData.type1),
            ),
          ),
          Spacer(),
          Text(
            convertValue(value),
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: pokemonColor(pokeData.type1),
            ),
          ),
          Container(
            width: 250,
            height: 10,
            margin: EdgeInsets.only(left: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[300],
                valueColor:
                    AlwaysStoppedAnimation<Color>(pokemonColor(pokeData.type1)),
                value: value,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Text(
                'Pokemon Stats',
                style: TextStyle(
                  color: pokemonColor(pokeData.type1),
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            statsBar('HP', pokeData.hp),
            statsBar('ATK', pokeData.attack),
            statsBar('DEF', pokeData.defense),
            statsBar('SATK', pokeData.spAttack),
            statsBar('SDEF', pokeData.spDefense),
            statsBar('SPD', pokeData.speed),
          ],
        ),
      ),
    );
  }
}
