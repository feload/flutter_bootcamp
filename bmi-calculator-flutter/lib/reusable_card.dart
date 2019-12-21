import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color color;
  final Widget cardChild;
  final Function updateFn;

  ReusableCard({@required this.color, this.cardChild, this.updateFn});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: updateFn,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: color,
        )
      ),
    );
  }
}