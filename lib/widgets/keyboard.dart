import 'package:flutter/material.dart';

import 'package:firstflutterweb/widgets/button.dart';

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              children: [
                Button(text: 'C', height: 70, width: 70),
                Button(text: '/', height: 70, width: 70),
                Button(text: '*', height: 70, width: 70),
              ],
            ),
            Row(
              children: [
                Button(text: '7', height: 70, width: 70),
                Button(text: '8', height: 70, width: 70),
                Button(text: '9', height: 70, width: 70),
              ],
            ),
            Row(
              children: [
                Button(text: '4', height: 70, width: 70),
                Button(text: '5', height: 70, width: 70),
                Button(text: '6', height: 70, width: 70),
              ],
            ),
            Row(
              children: [
                Button(text: '1', height: 70, width: 70),
                Button(text: '2', height: 70, width: 70),
                Button(text: '3', height: 70, width: 70),
              ],
            ),
            Row(
              children: [
                Button(text: '0', height: 70, width: 150),
                Button(text: '.', height: 70, width: 70),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Button(text: '-', height: 70, width: 70),
            Button(text: '+', height: 150, width: 70),
            Button(text: '=', height: 150, width: 70),
          ],
        ),
      ],
    );
  }
}
