import 'package:flutter/cupertino.dart';

//Davide Castelletto 24/01/2022

class Images extends StatelessWidget {
  final int number;

  Images({Key? key, required this.number}) : super(key: key);

  var image = [
    const AssetImage('image/1.png'),
    const AssetImage('image/2.png'),
    const AssetImage('image/3.png'),
    const AssetImage('image/4.png'),
  ];

  List<String> name = [
    'Rick Sanchez',
    'Morty Smith',
    'Summer Smith',
    'Beth Smith',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      const Padding(padding: EdgeInsets.only(top: 20.0)),
      SizedBox(
          height: 140,
          width: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image(image: image[number]),
          )),
      const Padding(padding: EdgeInsets.only(top: 10.0)),
      Container(
        child: Text(name[number], style: const TextStyle(fontSize: 15)),
      )
    ]));
    throw UnimplementedError();
  }
}
