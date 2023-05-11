import 'package:flutter/material.dart';

Color backgroundColor = Color(0xFFFFCC01);

Color pokemonColor(String type) {
  type = type.toLowerCase();
  if (type == null) {
    return Color(0xffdbd9d9);
  }
  switch (type) {
    case 'fire':
      return Color(0xfffa9950);
      break;
    case 'grass':
      return Color(0xff91eb5b);
      break;
    case 'water':
      return Color(0xFF69b9e3);
      break;
    case 'rock':
      return Color(0xffedd040);
      break;
    case 'bug':
      return Color(0xffbed41c);
      break;
    case 'normal':
      return Color(0xffC6C6A7);
      break;
    case 'poison':
      return Color(0xffd651d4);
      break;
    case 'electric':
      return Color(0xffF7D02C);
      break;
    case 'ground':
      return Color(0xfff5d37d);
      break;
    case 'ice':
      return Color(0xff79dbdb);
      break;
    case 'dark':
      return Color(0xffa37e65);
      break;
    case 'fairy':
      return Color(0xfffaa7d0);
      break;
    case 'psychic':
      return Color(0xffff80a6);
      break;
    case 'fighting':
      return Color(0xffe8413a);
      break;
    case 'ghost':
      return Color(0xff9063c9);
      break;
    case 'flying':
      return Color(0xffbda8f7);
      break;
    case 'dragon':
      return Color(0xff9065f7);
      break;
    case 'steel':
      return Color(0xffa0a0de);
      break;
    default:
      return Color(0xffdbd9d9);
  }
}
