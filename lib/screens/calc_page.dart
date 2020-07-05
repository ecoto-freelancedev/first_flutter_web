import 'package:flutter/material.dart';

import 'package:firstflutterweb/widgets/keyboard.dart';
import 'package:firstflutterweb/widgets/result_box.dart';

class CalcPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          height: 550,
          width: 350,
          padding: const EdgeInsets.all(8.0),
          color: Colors.indigo,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ResultBox(),
              Keyboard(),
            ],
          ),
        ),
      ),
    );
  }
}
