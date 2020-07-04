import 'dart:math';

class BMI {
  double _bmi;
  String _label;
  String _interpretation;

  BMI(this._bmi, this._label, this._interpretation);

  static BMI getBMI(int height, int weight) {
    double bmi = weight / pow(height / 100, 2);
    String label, interpretation;
    if(bmi >= 25) {
      label = 'Overweight';
      interpretation = 'Your BMI is over 25, which is the upper limit of the normal range.';
    } else if (bmi > 18.5) {
      label = 'Normal';
      interpretation = 'Your BMI lies between 18.5 and 25, which is the normal range.';
    } else {
      label = 'Underweight';
      interpretation = 'Your BMI is under 18.5, which is the lower limit of the normal range.';
    }
    return BMI(bmi, label, interpretation);
  }

  String get interpretation => _interpretation;

  String get label => _label;

  double get bmi => _bmi;
}
