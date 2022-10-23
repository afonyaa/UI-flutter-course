// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';

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
  late List<String> jokes;
  late int currentJokeIdx;

  @override
  void initState() {
    jokes = [
      "But please don't tell Chuck Norris",
      "Chuck Norris does not sleep. He waits.",
      "The chief export of Chuck Norris is pain",
      "Chuck Norris can dribble a bowling ball."
    ];
    currentJokeIdx = 0;

    super.initState();
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
                    child: Text(jokes[currentJokeIdx], // todo: textWrap:
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white54,
                            fontSize: 52)))
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

  void _updateJoke() {
    Random random = Random();
    int newIdx = random.nextInt(jokes.length);
    setState(() {
      currentJokeIdx = newIdx;
    });
  }
}
