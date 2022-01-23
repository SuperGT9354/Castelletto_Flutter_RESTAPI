import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'data.dart';

List<Data> character = [];

class Http extends StatefulWidget {
  final int character;

  const Http({Key? key, required this.character}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _HttpState createState() => _HttpState(character);
}

class _HttpState extends State<Http> {
  final int character;

  Future<Data> fetchData() async {
    http.Response response = await http.get(Uri.parse(
        'https://rickandmortyapi.com/api/character/' + character.toString()));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Data.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load character');
    }
  }

  _HttpState(this.character);

  late Future<Data> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<Data>(
            future: futureData,
            builder: (context, snapshot) {
              String _stampa = ('Name: ' +
                  snapshot.data!.name +
                  '\nStatus: ' +
                  snapshot.data!.status +
                  '\nSpecies: ' +
                  snapshot.data!.species +
                  '\nGender: ' +
                  snapshot.data!.gender);
              if (snapshot.hasData) {
                return Container(
                    child: Column(children: <Widget>[
                  SizedBox(
                      height: 160,
                      width: 160,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.network(snapshot.data!.image),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 25.0)),
                  Container(
                    child: Text(_stampa, style: const TextStyle(fontSize: 15)),
                  )
                ]));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            }));
  }
}

class Imageshow extends StatefulWidget {
  final int character;

  const Imageshow({Key? key, required this.character}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ImageshowState createState() => _ImageshowState(character);
}

class _ImageshowState extends State<Imageshow> {
  final int character;

  _ImageshowState(this.character);

  Future<Data> fetchData() async {
    http.Response response = await http.get(Uri.parse(
        'https://rickandmortyapi.com/api/character/' + character.toString()));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Data.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load character');
    }
  }

  late Future<Data> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        children: Column(
      children: Container(
          child: FutureBuilder<Data>(
              future: futureData,
              builder: (context, snapshot) {
                String _stampa = (snapshot.data!.name);
                if (snapshot.hasData) {
                  return Container(
                      child: Column(children: <Widget>[
                    const Padding(padding: EdgeInsets.only(top: 20.0)),
                    SizedBox(
                        height: 140,
                        width: 140,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Image.network(snapshot.data!.image),
                        )),
                    const Padding(padding: EdgeInsets.only(top: 10.0)),
                    Container(
                      child:
                          Text(_stampa, style: const TextStyle(fontSize: 15)),
                    )
                  ]));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              })),
    ));
  }
}
