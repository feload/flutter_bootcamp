import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage("images/feload.jpg"),
                  ),
                  Text(
                    "Felipe L.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico"
                    ),
                  ),
                  Text(
                    "Software Architect".toUpperCase(),
                    style: TextStyle(
                      color: Colors.teal[50],
                      fontFamily: "Source Sans Pro"
                    )
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.phone, color: Colors.teal[700],),
                        SizedBox(width: 10.0,),
                        Text("+52 4611301332",
                          style: TextStyle(
                            color: Colors.teal[800]
                          )
                        )
                      ],
                    )
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.email, color: Colors.teal[700],),
                        SizedBox(width: 10.0,),
                        Text("feload@gmail.com",
                          style: TextStyle(
                            color: Colors.teal[800]),
                          )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        )
      )
    );
  }
}