import 'package:flutter/material.dart';

Widget pokemonLoading() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/gif/pikachu-running.gif',
          height: 80,
        ),
        Text('Loading...'),
      ],
    ),
  );
}
