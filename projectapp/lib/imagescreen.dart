import 'package:flutter/material.dart';

import 'http.dart';

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
            title: Imageshow(character: images[index]),
            /*onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(todo: todos[index]),*/
          );
        },
      ),
    );
  }
}
