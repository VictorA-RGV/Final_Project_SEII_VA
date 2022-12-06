import 'dart:async';
import 'package:flutter/material.dart';
import 'recipe_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => RecipeSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4C748B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HOMEBREW",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Norwester',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 48,
                  letterSpacing: 0.1,
                  color: Color(0xFFFFFFFF)),
            ),
            Text(
              "Handmade Coffee",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Kollektif',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  letterSpacing: 0.1,
                  color: Color(0xFFFFFFFF)),
            )
          ],
        ),
      ),
    );
  }
}
