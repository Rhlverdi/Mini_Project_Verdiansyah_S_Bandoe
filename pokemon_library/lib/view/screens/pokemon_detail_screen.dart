import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemon_library/const/colors.dart';
import 'package:pokemon_library/db/database_helper.dart';
import 'package:pokemon_library/models/favorite_pokemon_table.dart';
import 'package:pokemon_library/models/pokemon_model.dart';
import 'package:pokemon_library/provider/detail_provider.dart';
import 'package:pokemon_library/view/widgets/pokemon_about_widget.dart';
import 'package:pokemon_library/view/widgets/pokemon_loading_widget.dart';
import 'package:pokemon_library/view/widgets/pokemon_moves_widget.dart';
import 'package:pokemon_library/view/widgets/pokemon_stats_widget.dart';
import 'package:pokemon_library/view/widgets/type_card_widget.dart';
import 'package:provider/provider.dart';

class PokemonDetailScreen extends StatefulWidget {
  static const routeName = '/pokemonDetailScreen';

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  int _selectedIndex = 0;
  var _isInit = true;

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final pokemonId = ModalRoute.of(context).settings.arguments as String;
      Provider.of<DetailProvider>(context).getPokeData(pokemonId);
    }
    _isInit = false;
  }

  Widget _buttonBuilder(PokemonModel pokeData, String title, int myIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = myIndex;
        });
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _selectedIndex == myIndex
              ? pokemonColor(pokeData.type1)
              : Colors.transparent,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: _selectedIndex == myIndex
                    ? Colors.white
                    : pokemonColor(pokeData.type1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<DetailProvider>(context);
    final pokeData = providerData.pokemon;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 50,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () async {
                var pokemonIsFavorite =
                    await DatabaseHelper().getFavoriteStatus(
                  int.parse(pokeData.id),
                );
                if (pokemonIsFavorite != null) {
                  DatabaseHelper().removeFavoritePokemon(
                    int.parse(
                      pokeData.id,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.red,
                      content: Center(
                        child: Text(
                          'Pokemon deleted from favorite',
                        ),
                      ),
                    ),
                  );
                } else {
                  DatabaseHelper().insertFavoritePokemon(
                    FavoritePokemonTable(
                      id: pokeData.id,
                      name: pokeData.name,
                      // type1: pokeData.type1,
                      // sprite: pokeData.sprite,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.green,
                      content: Center(
                        child: Text(
                          'Pokemon added to favorite',
                        ),
                      ),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.favorite,
              ),
            ),
          ),
        ],
      ),
      backgroundColor:
          providerData.isLoading ? Colors.white : pokemonColor(pokeData.type1),
      body: providerData.isLoading
          ? pokemonLoading()
          : Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 1.9,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 35,
                      bottom: -40,
                      left: 35,
                      child: Image.network(
                        pokeData.sprite,
                        scale: 1.8,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          toBeginningOfSentenceCase(pokeData.name),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 35,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Pokemon Type',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (pokeData.type1 != null)
                              TypeCardWidget(pokeData.type1),
                            SizedBox(width: 10),
                            if (pokeData.type2 != null)
                              TypeCardWidget(pokeData.type2),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buttonBuilder(pokeData, 'ABOUT', 0),
                            _buttonBuilder(pokeData, 'STATS', 1),
                            _buttonBuilder(pokeData, 'MOVES', 2),
                          ],
                        ),
                        _selectedIndex == 0
                            ? Expanded(
                                child: PokemonAboutWidget(pokeData),
                              )
                            : _selectedIndex == 1
                                ? Expanded(
                                    child: PokemonStatsWidget(pokeData),
                                  )
                                : Expanded(
                                    child: PokeMovesWidget(pokeData),
                                  )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
