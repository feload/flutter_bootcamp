import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CounterCard extends StatelessWidget {

  CounterCard({this.title, this.value, this.onDecrease, this.onIncrease});

  final String value;
  final String title;
  final Function onIncrease;
  final Function onDecrease;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(child: Text(title.toUpperCase(), style: labelStyle)),
        Text(value, style: labelStyleLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(icon: Icons.add,onPress: onIncrease,),
            SizedBox(width: 10.0,),
            RoundIconButton(
              icon: Icons.remove,
              onPress: onDecrease
            )
          ],
        )
      ],
    );
  }
}