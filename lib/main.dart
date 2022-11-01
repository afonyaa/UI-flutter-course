// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chack_norris/models/Joke.dart';
import 'package:chack_norris/api/DioClient.dart';

void main() {
  runApp(ChackNorrisApp());
}

class ChackNorrisApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<ChackNorrisApp> {
  // late final List<String> jokes;
  // late final int currentJokeIdx;
  late String _currentJoke = "";
  late final DioClient dioClient = DioClient();

  @override
  void initState() {
    _updateJoke();

    super.initState();
  }

  void _updateJoke() {
    dioClient.getJoke().then((joke) => {
          setState(() {
            _currentJoke = joke!.value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Chack Norris jokes!"),
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
                      "Press the button!",
                      style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(206, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Text(_currentJoke,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white54,
                            fontSize: 42)))
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: _updateJoke,
          child: Icon(Icons.sentiment_very_satisfied),
          backgroundColor: Color(0xFF35495e),
        ),
      ),
    );
  }
}
