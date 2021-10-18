import 'package:flutter/material.dart';

class BmiProvider with ChangeNotifier{
  double _height = 0.0;
  double _weight = 0;
  double _result = 0;

  double get height => _height;
  double get weight => _weight;
  double get result => _result;

  set height (double h){
    _height = h;
  }
  set weight (double w){
    _weight = w;
  }

  void heightIncrement (){
    _height += 0.1;
    notifyListeners();
  }
  void heightDecrement(){
    _height --;
    notifyListeners();
  }

  void weightIncrement (){
    _weight++;
    notifyListeners();
  }
  void weightDecrement(){
    _weight--;
    notifyListeners();
  }

  void calculate(){
    _height = _height/10.7584; // in m*m
    _result = weight/height;
  }
  void refresh(){
    _height = 0;
    _weight = 0;
    _result = 0;
  }
}