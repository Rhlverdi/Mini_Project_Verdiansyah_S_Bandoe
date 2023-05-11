import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemon_library/const/colors.dart';
import 'package:pokemon_library/view/screens/pokemon_detail_screen.dart';

class PokemonCardWidget extends StatelessWidget {
  final dynamic poke;
  final BuildContext context;

  const PokemonCardWidget(this.poke, this.context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(PokemonDetailScreen.routeName, arguments: poke.id);
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, left: 5, right: 5),
        decoration: BoxDecoration(
          color: pokemonColor(poke.type.toString()),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  toBeginningOfSentenceCase(poke.name),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/gif/pokeLoad.gif',
                image: poke.sprite,
                imageScale: 3.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
