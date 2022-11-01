// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:chack_norris/views/jokes_generator.dart';
import 'package:chack_norris/views/jokes_favorite.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => JokesGenerator(),
        '/favorites': (context) => JokesFavorite(),
      },
    ),
  );
}
