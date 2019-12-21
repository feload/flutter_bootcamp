import 'dart:ffi';

import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'counter_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleColor = inactiveColor;
  Color femaleColor = inactiveColor;
  int heightValue = 110;
  int weight = 60;
  int age = 25;

  void updateGenderColor(Gender gender){
    setState(() {
      if (gender == Gender.male){
        maleColor = activeColor;
        femaleColor = inactiveColor;
      }else{
        maleColor = inactiveColor;
        femaleColor = activeColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:
        Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        color: maleColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          text: "Male",
                        ),
                        updateFn: () {
                          updateGenderColor(Gender.male);
                        },
                    )
                  ),
                  Expanded(
                      child: ReusableCard(
                        color: femaleColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          text: "Female",
                        ),
                        updateFn: () {
                          updateGenderColor(Gender.female);
                        },
                    )
                  )
                ],
              ),
            ),

            Expanded(
              child: ReusableCard(
                color: activeColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(child: Text("HEIGHT", style: labelStyle)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(heightValue.toString(), style: labelStyleLarge),
                        Text("cm")
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                      ),
                      child: Slider(
                          value: heightValue.toDouble(),
                          max: 220,
                          min: 110,
                          onChanged: (double value) {
                            setState(() {
                              heightValue = value.toInt();
                            });
                          },
                        )
                    )
                  ],
                ),
              )
            ),

            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: activeColor,
                      cardChild: CounterCard(
                        title: "Weight",
                        value: weight.toString(),
                        onIncrease: () {
                          setState(() {
                            weight++;
                          });
                        },
                        onDecrease: () {
                          setState(() {
                            weight--;
                          });
                        }
                      ),
                    )
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: activeColor,
                      cardChild: CounterCard(
                        title: "Age",
                        value: age.toString(),
                        onIncrease: () {
                          setState(() {
                            age++;
                          });
                        },
                        onDecrease: () {
                          setState(() {
                            age--;
                          });
                        }
                      ),
                    )
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}

