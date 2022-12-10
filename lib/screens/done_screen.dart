import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 600,
          width: 400,
          child: Center(
            child: Text(
              "enjoy your amazing \n handmade coffee",
              style: TextStyle(
                  fontFamily: 'montserrat',
                  fontSize: 18,
                  color: Color(0xFFFF4C748B)),
              key: Key('enjoy-coffee-txt'),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeSelectionScreen(),
                ));
          },
          child: Text('done',
              style: TextStyle(
                  fontFamily: 'montserrat',
                  fontSize: 18,
                  color: Color(0xFFFF4C748B)),
              key: Key('done-btn')),
        )
      ],
    ));
  }
}
