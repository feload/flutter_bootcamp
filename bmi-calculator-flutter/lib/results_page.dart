import 'package:bmi_calculator/calculator_args.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    CalculatorArgs args = ModalRoute.of(context).settings.arguments;
    CalculatorBrain brain = CalculatorBrain(height: args.height, weight: args.weight);

    double bmi = brain.calculateBMI();
    Result result = brain.getResult(bmi);
    String fResult = brain.getFriendlyResult(result);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text("Your Result", style: TextStyle(fontSize: 44.0),),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(fResult, style: TextStyle(fontSize: 35.0)),
                  Text(bmi.toStringAsFixed(1), style: TextStyle(fontSize:125.0))
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.pink,
                  padding: EdgeInsets.all(20.0),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("RE-CALCULATE"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}