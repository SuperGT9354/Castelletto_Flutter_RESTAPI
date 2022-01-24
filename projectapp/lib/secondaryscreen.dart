import 'package:flutter/material.dart';
import 'package:projectapp/http.dart';

//Davide Castelletto 24/01/2022

//classe che crea la seconda schermata contenente i dati del personaggio cliccato
class SecondScreen extends StatefulWidget {
  final int character;

  const SecondScreen({Key? key, required this.character}) : super(key: key);

  @override
  SecondScreenState createState() => SecondScreenState(character);
}

class SecondScreenState extends State<SecondScreen> {
  final int character;

  SecondScreenState(this.character);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //funzione che permette l'ottenimento dei dati
          children: [Http(character: character)],
        )));
  }
}
