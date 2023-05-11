import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemon_library/const/colors.dart';

class TypeCardWidget extends StatelessWidget {
  final String type;

  TypeCardWidget(this.type);

  @override
  Widget build(BuildContext context) {
    String typeText = toBeginningOfSentenceCase(type);
    return Material(
      shadowColor: pokemonColor(type),
      borderRadius: BorderRadius.circular(3),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: pokemonColor(type),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              typeText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.5, 2),
                    blurRadius: 3.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
