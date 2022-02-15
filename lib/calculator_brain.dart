import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String BmiValue() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String Interpretation() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String Advice() {
    if (_bmi >= 25) {
      return "Your BMI result is quite high! you should exercise more";
    } else if (_bmi > 18.5) {
      return "Your BMI result is normal! well done!";
    } else {
      return "Your BMI result is quite low! you should eat more";
    }
  }
}
