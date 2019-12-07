import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  Widget noteKey(Color color, String keyNumber) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          player.play('note$keyNumber.wav');
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                noteKey(Colors.red, '1'),
                noteKey(Colors.orange, '2'),
                noteKey(Colors.yellow, '3'),
                noteKey(Colors.green, '4'),
                noteKey(Colors.teal, '5'),
                noteKey(Colors.blue, '6'),
                noteKey(Colors.purple, '7')
              ],
            )
          ),
        ),
      ),
    );
  }
}
