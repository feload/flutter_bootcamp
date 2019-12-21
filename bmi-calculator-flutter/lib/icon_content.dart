import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {

  final IconData icon;
  final String text;
  IconContent({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 120.0, color: Colors.white,),
        SizedBox(height: 15.0,),
        Text(text.toUpperCase(), style: labelStyle)
      ],
    );
  }
}
