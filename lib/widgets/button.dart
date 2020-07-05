import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:firstflutterweb/providers/calc_provider.dart';

class Button extends StatelessWidget {
  final String text;
  final double height;
  final double width;

  const Button({this.text, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final calcProvider = Provider.of<CalcProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: FlatButton(
          onPressed: () => _onPressed(calcProvider, text),
          child: Text(
            text,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onPressed(CalcProvider calcProvider, String text) {
    switch (text) {
      case 'C':
        {
          _clean(calcProvider);
          calcProvider.textResultController.clear();
        }
        break;
      case '/':
        _addOperation(calcProvider, text);
        break;
      case '*':
        _addOperation(calcProvider, text);
        break;
      case '-':
        _addOperation(calcProvider, text);
        break;
      case '+':
        _addOperation(calcProvider, text);
        break;
      case '.':
        calcProvider.screenText += text;
        calcProvider.textResultController.text = calcProvider.screenText;
        break;
      case '=':
        {
          _storeValues(calcProvider);
          calcProvider.textResultController.text =
              _getResult(calcProvider, calcProvider.mathOp);
          _clean(calcProvider);
        }
        break;
      default:
        {
          _enterNumbers(calcProvider, text);
        }
        break;
    }
  }

  void _clean(CalcProvider calcProvider) {
    calcProvider.screenText = '';
    calcProvider.val = '';
    calcProvider.values.clear();
    calcProvider.mathOp = '';
  }

  void _addOperation(CalcProvider calcProvider, String text) {
    calcProvider.screenText += text;
    calcProvider.mathOp = text;
    calcProvider.textResultController.text = calcProvider.screenText;
  }

  String _getResult(CalcProvider calcProvider, String mathOp) {
    if (mathOp == '/') {
      calcProvider.result = calcProvider.values[0] / calcProvider.values[1];
    } else if (mathOp == '*') {
      calcProvider.result = calcProvider.values[0] * calcProvider.values[1];
    } else if (mathOp == '-') {
      calcProvider.result = calcProvider.values[0] - calcProvider.values[1];
    } else {
      calcProvider.result = calcProvider.values[0] + calcProvider.values[1];
    }
    return calcProvider.result.toStringAsFixed(2);
  }

  void _storeValues(CalcProvider calcProvider) {
    for (int i = 0; i < calcProvider.screenText.length; i++) {
      if (calcProvider.screenText[i] != calcProvider.mathOp ||
          calcProvider.screenText[i] == '.') {
        calcProvider.val += calcProvider.screenText[i];
      } else {
        calcProvider.values
            .add(double.parse(calcProvider.val)); //Store the first value
        calcProvider.val = '';
      }
    }
    calcProvider.values
        .add(double.parse(calcProvider.val)); //Store the second value
  }

  void _enterNumbers(CalcProvider calcProvider, String text) {
    calcProvider.screenText += text;
    calcProvider.textResultController.text = calcProvider.screenText;
  }
}
