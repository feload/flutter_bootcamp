import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("I am a Robot"),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: Center(
          child: Image(
            image: AssetImage("images/robot.png"),
          ),
        ),
        backgroundColor: Colors.blueGrey[50],
      )
    )
  );
}