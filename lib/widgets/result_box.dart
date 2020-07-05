import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:firstflutterweb/providers/calc_provider.dart';

class ResultBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calcProvider = Provider.of<CalcProvider>(context);
    return Container(
      height: 75,
      width: 315,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: calcProvider.textResultController,
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
}
