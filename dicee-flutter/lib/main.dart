import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DicePageState();
  }
}

class DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  _rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                child: Image.asset('images/dice$leftDiceNumber.png'),
                onPressed: _rollDice,
              )
            ),
            Expanded(
              child: FlatButton(
                child: Image.asset('images/dice$rightDiceNumber.png'),
                onPressed: _rollDice,
              )
            )
          ],
        ),
      ),
    );
  }
}