import 'package:flutter/material.dart';
import 'package:pokemon_library/provider/detail_provider.dart';
import 'package:pokemon_library/provider/favorite_pokemon_provider.dart';
import 'package:pokemon_library/provider/home_provider.dart';
import 'package:pokemon_library/view/screens/favorite_pokemon_screen.dart';
import 'package:pokemon_library/view/screens/pokemon_detail_screen.dart';
import 'package:pokemon_library/view/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoritePokemonProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        PokemonDetailScreen.routeName: (context) => PokemonDetailScreen(),
        FavoritePokemonScreen.routeName: (context) => FavoritePokemonScreen(),
      },
    );
  }
}
