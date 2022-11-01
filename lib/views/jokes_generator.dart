// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:chack_norris/api/dio_client.dart';

class JokesGenerator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JokesGeneratorState();
  }
}

class _JokesGeneratorState extends State<JokesGenerator> {
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
                children: [
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
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF35495e)),
                    ),
                    onPressed: _goToFavorites,
                    child: Text('Or go to favorites'),
                  )
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Text(_currentJoke,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white54,
                          fontSize: 32)))
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateJoke,
        child: Icon(Icons.sentiment_very_satisfied),
        backgroundColor: Color(0xFF35495e),
      ),
    );
  }
}
