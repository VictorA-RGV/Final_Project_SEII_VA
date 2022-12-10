import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';

class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];

    return Scaffold(
        backgroundColor: Color(0XFF4C748B),
        body: Center(
          child: ListView(
            children: [
              Container(
                height: 50,
                width: 118,
              ),
              Container(
                height: 115,
                width: 118,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${stepTimeRemaining}",
                      key: Key("cnt-dwn"),
                      style: TextStyle(
                          fontSize: 96,
                          letterSpacing: 10,
                          fontFamily: 'Kollektif',
                          color: Color(0xFFFFFFFFF)),
                      
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                height: 29,
                width: 206,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${currentRecipeStep.text}",
                      key: Key("current-step-large-text"),
                      style: TextStyle(
                          fontSize: 24,
                          letterSpacing: 2,
                          fontFamily: 'Kollektif',
                          color: Color(0xFFFFFFFFF)),
                      
                    ),
                  ],
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(25)),
                  SizedBox(
                    height: 17,
                    width: 337,
                    child: Text("Steps",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            fontFamily: 'Kollektif',
                            color: Color(0xFFFFFFFFF))),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(4)),
              SizedBox(
                width: 337,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (RecipeStep step in remainingSteps)
                      Container(
                        height: 36,
                        width: 337,
                        margin: const EdgeInsets.only(bottom: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: currentRecipeStep == step
                                ? Color(0xFFFFFFFFF)
                                : Colors.transparent,
                          ),
                        ),
                        child: ListTile(
                            key: Key("recipe-steps-${step}"),
                            dense: true,
                            visualDensity: VisualDensity(vertical: -3.5),
                            title: Text(
                              "${step.text}",
                              style: TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 1,
                                  fontFamily: 'Kollektif',
                                  color: Color(0xFFFFFFFFF)),
                            ),
                            trailing: Text(
                              "${RecipeStep.timeDisplayed(step.time)}",
                              style: TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 1,
                                  fontFamily: 'Kollektif',
                                  color: Color(0xFFFFFFFFF)),
                              key: Key("step-min-sec"),
                            )),
                      )
                  ],
                ),
              )
              // for (RecipeStep step in remainingSteps)
              //ListTile(
              //      title: Text(
              //    step.text,
              //    style: TextStyle(
              //        fontSize: 12,
              //       fontFamily: 'Kollektif',
              //       color: Color(0xFFFFFFFF)),
              // ),)
            ],
          ),
        ));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
