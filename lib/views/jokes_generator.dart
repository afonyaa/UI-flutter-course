// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:chack_norris/hive/favorite_jokes.dart';
import 'package:chack_norris/models/Joke.dart';
import 'package:flutter/material.dart';
import 'package:chack_norris/api/dio_client.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class JokesGenerator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JokesGeneratorState();
  }
}

class _JokesGeneratorState extends State<JokesGenerator> {
  late String _currentJokeText = "";
  final DioClient dioClient = DioClient();
  final Box favJokesBox = Hive.box('favoriteJokes');
  late bool isLoadingJoke = false;
  late final String fetchingError = 'Chack broke my app( No jokes, man.';
  late bool isFetchingError = false;

  @override
  void initState() {
    _updateJoke();
    super.initState();
  }

  void handleFetchError() {
    setState(() {
      isFetchingError = true;
    });
  }

  void _updateJoke() {
    setState(() {
      isLoadingJoke = true;
    });
    dioClient
        .getJoke()
        .then((joke) => {
              setState(() {
                _currentJokeText = joke!.value;
                isLoadingJoke = false;
              })
            })
        .catchError(handleFetchError);
  }

  void _addJokeToFavorites() {
    favJokesBox.add(FavoriteJokes(
        value: _currentJokeText,
        id: new DateTime.now().millisecondsSinceEpoch.toString()));
  }

  void _goToFavorites() {
    Navigator.pushNamed(context, '/favorites');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                children: !isFetchingError
                    ? [
                        Container(
                            margin: const EdgeInsets.only(right: 2.0),
                            child: Text(
                              "Press the button!",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color.fromARGB(206, 255, 255, 255),
                                  fontWeight: FontWeight.bold),
                            )),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF35495e)),
                          ),
                          onPressed: _goToFavorites,
                          child: Text('Or go to favorites'),
                        )
                      ]
                    : [Text(fetchingError)],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: !isLoadingJoke
                        ? [
                            Text(_currentJokeText,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white54,
                                    fontSize: 32)),
                            IconButton(
                              icon: const Icon(Icons.auto_awesome),
                              color: Colors.white,
                              onPressed:
                                  !isFetchingError ? _addJokeToFavorites : null,
                            ),
                          ]
                        : [
                            Text('Loading...',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white54,
                                    fontSize: 42)),
                          ],
                  ))
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateJoke,
        child: Icon(Icons.next_plan),
        backgroundColor: Color(0xFF35495e),
      ),
    );
  }
}
