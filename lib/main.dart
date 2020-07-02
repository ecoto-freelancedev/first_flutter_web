import 'package:flutter/material.dart';

import 'package:firstflutterweb/screens/calc_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web App',
      home: CalcPage(),
    );
  }
}
