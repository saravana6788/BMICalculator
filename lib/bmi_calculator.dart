import 'dart:math';

class BMICalculator{
  int height;
  int weight;

  double _bmi = 0.0;
  BMICalculator({required this.height, required this.weight});

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMIStatus(){
    if(_bmi >= 25.0){
      return "OVERWEIGHT";
    }else if(_bmi>=18.5){
      return "NORMAL";
    }else{
      return "UNDERWEIGHT";
    }
  }

  String getBMIInterpretationText(){
    if(_bmi >= 25.0){
      return "You have a higher than normal body weight. Try to exercise more";
    }else if(_bmi>=18.5){
      return "You have a normal body weight. Good Job!!";
    }else{
      return "You have a lower than normal body weight. You can eat a bit more";
    }
  }


}