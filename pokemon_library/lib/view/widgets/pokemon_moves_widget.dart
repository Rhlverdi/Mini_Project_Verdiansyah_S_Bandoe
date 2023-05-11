import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemon_library/const/colors.dart';
import 'package:pokemon_library/models/pokemon_model.dart';

class PokeMovesWidget extends StatelessWidget {
  final PokemonModel pokeData;
  PokeMovesWidget(this.pokeData);

  Widget moveLabel(String text, dynamic pokeData) {
    return Container(
      decoration: BoxDecoration(
        color: pokemonColor(pokeData.type1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          toBeginningOfSentenceCase(text),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 7,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List moveList = pokeData.moves;
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        childAspectRatio: 4,
        crossAxisSpacing: 5,
        children: moveList.map((item) => moveLabel(item, pokeData)).toList(),
      ),
    );
  }
}
