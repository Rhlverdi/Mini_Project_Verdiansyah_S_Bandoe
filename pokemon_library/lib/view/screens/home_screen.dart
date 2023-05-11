import 'package:flutter/material.dart';
import 'package:pokemon_library/const/colors.dart';
import 'package:pokemon_library/provider/home_provider.dart';
import 'package:pokemon_library/view/screens/favorite_pokemon_screen.dart';
import 'package:pokemon_library/view/widgets/pokemon_card_widget.dart';
import 'package:pokemon_library/view/widgets/pokemon_loading_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<HomeProvider>(context);
    final pokeData = data.pokemonList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Center(
            child: Image.asset(
              'assets/images/pokemon-library.png',
              height: 90,
            ),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 10),
            onPressed: () {
              Navigator.of(context).pushNamed(FavoritePokemonScreen.routeName);
            },
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: data.isLoading
                  ? pokemonLoading()
                  : SingleChildScrollView(
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        padding: EdgeInsets.only(top: 20),
                        children: [
                          ...pokeData
                              .map((item) => PokemonCardWidget(item, context))
                              .toList(),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
