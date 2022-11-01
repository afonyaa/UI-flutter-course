// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class JokesFavorite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JokesFavoriteState();
  }
}

class _JokesFavoriteState extends State<JokesFavorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: true,
        backgroundColor: Color(0xFF35495e),
      ),
      body: Container(
          padding: EdgeInsets.all(24),
          color: Color(0xFF42b883),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      child: Text(
                    "Favorite jokes!",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(206, 255, 255, 255),
                        fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ],
          )),
    );
  }
}
