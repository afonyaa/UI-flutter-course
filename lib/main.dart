// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:chack_norris/hive/favorite_jokes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:chack_norris/views/jokes_generator.dart';
import 'package:chack_norris/views/jokes_favorite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(FavoriteJokesAdapter());
  await Hive.openBox('favoriteJokes');
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
