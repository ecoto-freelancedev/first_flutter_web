import 'package:flutter/material.dart';

class CalcProvider with ChangeNotifier {
  TextEditingController _textResultController = TextEditingController();
  String _screenText = '';
  String _mathOp = ''; //Contains math operator
  String _val = ''; //May contain the values of the math operation
  List<double> _values =
      List<double>(); //Contains the values of the math operation
  double _result; //Result of the math operation

  get textResultController {
    return _textResultController;
  }

  set textResultController(String text) {
    this._textResultController.text = text;
    notifyListeners();
  }

  get screenText {
    return _screenText;
  }

  set screenText(String text) {
    this._screenText = text;
    notifyListeners();
  }

  get mathOp {
    return _mathOp;
  }

  set mathOp(String text) {
    this._mathOp = text;
    notifyListeners();
  }

  get val {
    return _val;
  }

  set val(String text) {
    this._val = text;
    notifyListeners();
  }

  get values {
    return _values;
  }

  set values(List<double> values) {
    this._values = values;
    notifyListeners();
  }

  get result {
    return _result;
  }

  set result(double result) {
    this._result = result;
    notifyListeners();
  }
}
