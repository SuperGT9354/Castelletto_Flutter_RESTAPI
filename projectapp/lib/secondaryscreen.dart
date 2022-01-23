import 'package:flutter/material.dart';

//Davide Castelletto 10/01/2022

class SecondScreen extends StatelessWidget {
  // Requiring the list of todos.
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'].toString();
    final texttoshow = routeArgs['text'].toString();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todos'),
        ),
        //passing in the ListView.builder
        body: Center(
            child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10.0)),
          (Container(child: Text(title + "\n" + texttoshow))),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'))
        ])));
  }
}
