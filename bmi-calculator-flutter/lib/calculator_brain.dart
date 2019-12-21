import 'dart:math';

import 'constants.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double calculateBMI() {
    return weight / pow(height / 100, 2);
  }

  Result getResult(double bmi) {
    if (bmi >= 25) {
      return Result.overweight;
    }else if (bmi > 18.5) {
      return Result.normal;
    }else{
      return Result.underweight;
    }
  }

  String getFriendlyResult(Result result){
    if (result == Result.overweight) {
      return 'Overweight';
    }else if (result == Result.normal) {
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
}