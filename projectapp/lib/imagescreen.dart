import 'package:flutter/material.dart';
import 'package:projectapp/images.dart';
import 'package:projectapp/secondaryscreen.dart';

//Davide Castelletto 24/01/2022

//classe per creare la lista di immagini nella schermata principali
class Imagescreen extends StatelessWidget {
  // Requiring the list of todos.
  const Imagescreen({Key? key, required this.images}) : super(key: key);

  final List<int> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //passing in the ListView.builder
        body: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return ListTile(
                //utilizza la funzione per prendere le immagini e i nomi da porre nella scheramat principale
                title: Images(number: images[index]),
                //porta alla seconda schermata attraverso il tocco dell'immagine
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SecondScreen(character: images[index]),
                      ));
                },
              );
            }));
  }
}
