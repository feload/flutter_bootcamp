import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MagicBall());

class MagicBall extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MagicBallState();
  }
}

class MagicBallState extends State<MagicBall> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[400],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("Ask Me Anything"),
        ),
        body: Container(
          child: Center(
            child: FlatButton(
              child: Image.asset('images/ball$ballNumber.png'),
              onPressed: (){
                setState(() {
                  ballNumber = Random().nextInt(5) + 1;
                });
              },
            )
          )
        )
      ),
    );
  }
}