import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:firstflutterweb/screens/calc_page.dart';
import 'package:firstflutterweb/providers/calc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CalcProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculator Web',
        home: CalcPage(),
      ),
    );
  }
}
