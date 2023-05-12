import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemon_library/const/colors.dart';
import 'package:pokemon_library/provider/favorite_pokemon_provider.dart';
import 'package:pokemon_library/view/screens/pokemon_detail_screen.dart';
import 'package:pokemon_library/view/widgets/pokemon_loading_widget.dart';
import 'package:provider/provider.dart';

class FavoritePokemonScreen extends StatefulWidget {
  static const routeName = '/favoritePokemonScreen';

  @override
  State<FavoritePokemonScreen> createState() => _FavoritePokemonScreenState();
}

class _FavoritePokemonScreenState extends State<FavoritePokemonScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProviderData = Provider.of<FavoritePokemonProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(right: 45),
          child: Center(
            child: Image.asset(
              'assets/images/favorite-pokemon.png',
              height: 90,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: FutureBuilder(
          future: favoriteProviderData.loadFavoritePokemonList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              if (data.length == 0) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/gif/confused-pikachu.gif',
                        height: 150,
                      ),
                      Text(
                        'No Favorite Pokemon Yet...',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          PokemonDetailScreen.routeName,
                          arguments: data[index].id.toString(),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                toBeginningOfSentenceCase(data[index].name),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
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
                                favoriteProviderData
                                    .removeFavoritePokemon(data[index].id);
                              },
                              icon: Icon(
                                Icons.delete,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return pokemonLoading();
          },
        ),
      ),
    );
  }
}
