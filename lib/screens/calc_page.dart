import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcPage extends StatefulWidget {
  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  TextEditingController _textResultController;
  String screenText = '';
  String val = ''; //May contain the values of the math operation
  double result; //Result of the math operation
  List<double> values; //Contains the values of the math operation
  String mathOp; //Contains math operator

  @override
  void initState() {
    super.initState();
    _textResultController = TextEditingController();
    values = List<double>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              resultBox(),
              keyBoard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget resultBox() {
    return Container(
      height: MediaQuery.of(context).size.height / 8.5,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: _textResultController,
        enabled: false,
        style: GoogleFonts.lato(
          textStyle:
              TextStyle(fontSize: 45, color: Colors.black, letterSpacing: 2.0),
        ),
        textAlign: TextAlign.end,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget keyBoard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              children: [
                button('C'),
                button('/'),
                button('*'),
                button('-'),
              ],
            ),
            Row(
              children: [
                button('7'),
                button('8'),
                button('9'),
                button('+'),
              ],
            ),
            Row(children: [
              button('4'),
              button('5'),
              button('6'),
              button('.'),
            ]),
            Row(children: [
              button('1'),
              button('2'),
              button('3'),
              button('='),
            ]),
            Row(children: [
              button('0'),
            ]),
          ],
        ),
      ],
    );
  }

  Widget button(String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 9.5,
        width: MediaQuery.of(context).size.width / 6.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: FlatButton(
          onPressed: () => _onPressed(text),
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

  void _clean() {
    screenText = '';
    val = '';
    values.clear();
    mathOp = '';
  }

  void _onPressed(String text) {
    switch (text) {
      case 'C':
        {
          _clean();
          _textResultController.clear();
        }
        break;
      case '/':
        _addOperation(text);
        break;
      case '*':
        _addOperation(text);
        break;
      case '-':
        _addOperation(text);
        break;
      case '+':
        _addOperation(text);
        break;
      case '.':
        _addOperation(text);
        break;
      case '=':
        {
          for (int i = 0; i < screenText.length; i++) {
            if (screenText[i] != mathOp || screenText[i] == '.') {
              val += screenText[i];
            } else {
              values.add(double.parse(val)); //Store the first value
              val = '';
            }
          }
          values.add(double.parse(val)); //Store the second value
          if (mathOp == '/') {
            result = values[0] / values[1];
          } else if (mathOp == '*') {
            result = values[0] * values[1];
          } else if (mathOp == '-') {
            result = values[0] - values[1];
          } else {
            result = values[0] + values[1];
          }
          _textResultController.text = result.toString();
          _clean();
        }
        break;
      default:
        {
          screenText += text;
          _textResultController.text = screenText;
        }
        break;
    }
  }

  void _addOperation(String text) {
    screenText += text;
    mathOp = text;
    _textResultController.text = screenText;
  }
}
