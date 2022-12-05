import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;
  double deviceSize(BuildContext context) => MediaQuery.of(context).size.height;

  RecipeDetailScreen(this.recipe);
  int keyID = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          key: Key('back-arrow-button'),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF4C748B),
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeSelectionScreen()));
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(deviceSize(context) * 0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(19, 0, 19, 0),
              child: Container(
                width: 337,
                height: 164,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF4C748B), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: TextDisplayedWidget(
                          recipe.name,
                          'recipe-name-key-${recipe.name}',
                          TextAlign.center,
                          'Kollektif',
                          FontStyle.normal,
                          FontWeight.w400,
                          18,
                          Color(0xFF4C748B)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(22, 8, 25, 10),
                      child: Divider(
                        height: 0,
                        thickness: 1.0,
                        color: Color(0xFF4C748B),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextDisplayedWidget(
                        '${recipe.coffeeVolumeGrams}g - ${recipe.grindSize}\n ${recipe.waterVolumeGrams}g - water',
                        'recipe-data-key',
                        TextAlign.center,
                        'Kollektif',
                        FontStyle.normal,
                        FontWeight.w400,
                        14,
                        Color(0xFF4C748B),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 20),
                      child: TextDisplayedWidget(
                          recipe.miscDetails,
                          'recipe-miscDetails-text',
                          TextAlign.center,
                          'Montserrat',
                          FontStyle.italic,
                          FontWeight.w400,
                          10,
                          Color(0xFF4C748B)),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(19, 40, 29, 10),
              child: Row(
                children: [
                  TextDisplayedWidget(
                      'Steps',
                      'steps-text',
                      TextAlign.left,
                      'Kollektif',
                      FontStyle.normal,
                      FontWeight.w400,
                      14,
                      Color(0xFF4C748B)),
                  Spacer(
                    flex: 1,
                  ),
                  TextDisplayedWidget(
                      'Total: ${RecipeStep.timeDisplayed(RecipeStep.totalTime(recipe))}',
                      'total-time-text',
                      TextAlign.right,
                      'Kollektif',
                      FontStyle.normal,
                      FontWeight.w400,
                      12,
                      Color(0xFF4C748B)),
                ],
              ),
            ),

            // ignore: sdk_version_ui_as_code
            for (RecipeStep step in recipe.steps)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(19, 0, 19, 0),
                    child: Container(
                      child: ListTile(
                        dense: true,
                        visualDensity: VisualDensity(
                          vertical: -3,
                        ),
                        title: TextDisplayedWidget(
                            step.text,
                            "step${keyID++}",
                            TextAlign.start,
                            'Kollektif',
                            FontStyle.normal,
                            FontWeight.w400,
                            12,
                            Color(0xFF4C748B)),
                        trailing: TextDisplayedWidget(
                            RecipeStep.timeDisplayed(step.time),
                            "${keyID++}-time-text",
                            TextAlign.right,
                            'Kollektif',
                            FontStyle.normal,
                            FontWeight.w400,
                            12,
                            Color(0xFF4C748B)),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF4C748B), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: 280,
          height: 46,
          child: ElevatedButton(
            key: Key('start-button'),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeStepsScreen(recipe)));
            },
            child: TextDisplayedWidget(
                'Start',
                'start-button-text',
                TextAlign.center,
                'Montserrat',
                FontStyle.normal,
                FontWeight.w400,
                14,
                Color(0xFFFFFFFF)),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF4C748B),
              padding: EdgeInsets.symmetric(horizontal: 100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextDisplayedWidget extends StatefulWidget {
  String textDisplayed, fontFamily;
  var fontWeight, textAlign, fontStyle, colorText;
  var keyID;
  double fontSize;

  TextDisplayedWidget(
      this.textDisplayed,
      this.keyID,
      this.textAlign,
      this.fontFamily,
      this.fontStyle,
      this.fontWeight,
      this.fontSize,
      this.colorText);

  @override
  State<TextDisplayedWidget> createState() => _TextDisplayedWidgetState();
}

class _TextDisplayedWidgetState extends State<TextDisplayedWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.textDisplayed,
      key: Key(widget.keyID),
      textAlign: widget.textAlign,
      style: TextStyle(
          fontFamily: widget.fontFamily,
          fontStyle: FontStyle.normal,
          fontWeight: widget.fontWeight,
          fontSize: widget.fontSize,
          letterSpacing: 0.1,
          color: widget.colorText),
    );
  }
}
