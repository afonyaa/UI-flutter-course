// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class JokesFavorite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JokesFavoriteState();
  }
}

class _JokesFavoriteState extends State<JokesFavorite> {
  late final Box favJokesBox = Hive.box('favoriteJokes');
  @override
  void initState() {
    super.initState();
  }

  _deleteJoke(int index) {
    favJokesBox.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: true,
        backgroundColor: Color(0xFF35495e),
      ),
      body: ValueListenableBuilder(
        valueListenable: favJokesBox.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(
              child: Text('Empty'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var currentBox = box;
                var jokeData = currentBox.getAt(index)!;
                return Container(
                  child: ListTile(
                    title: Text(
                      jokeData.value,
                      style: TextStyle(color: Color(0xFF35495e)),
                    ),
                    trailing: IconButton(
                      onPressed: () => _deleteJoke(index),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
