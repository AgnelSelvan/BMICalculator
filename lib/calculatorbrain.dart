import 'dart:math';

class calculatorBrain {
  calculatorBrain({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a weight more than noramal body. Try to excerise more!';
    } else if (_bmi > 18) {
      return 'You have a normal body.Good Job!';
    } else {
      return 'You have a lower more than noramal body. You need to eat more!';
    }
  }
}
