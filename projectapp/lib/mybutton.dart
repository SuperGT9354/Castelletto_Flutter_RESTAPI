import 'package:flutter/material.dart';
//Davide Castelletto 13/12/2021

class DecrementButton extends StatelessWidget {
  final String text;
  final Function() onClickHandler;
  //final String color;

  DecrementButton(this.text, this.onClickHandler);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        alignment: Alignment.center,
        //width: double.infinity,
        child: ElevatedButton(
          child: Text(this.text),
          onPressed: onClickHandler,
        ));
    throw UnimplementedError();
  }
}

class ColorButton extends StatefulWidget {
  String text = "";
  final Function() onClickHandler;
  var arr = [];

  ColorButton(this.text, this.onClickHandler, this.arr);

  @override
  ColorButtonState createState() =>
      ColorButtonState(this.text, this.onClickHandler, this.arr);
}

class ColorButtonState extends State<ColorButton> {
  var _color_count = 0;
  String text = "";
  final Function() onClickHandler;
  var arr = [];

  ColorButtonState(this.text, this.onClickHandler, this.arr);

  void onPressed() {
    setState(() {
      _color_count = (++_color_count) % arr.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            child: Text(this.text),
            onPressed: () {
              this.onPressed();
              onClickHandler();
            },
            style: ElevatedButton.styleFrom(primary: arr[_color_count])));
    throw UnimplementedError();
  }
}
