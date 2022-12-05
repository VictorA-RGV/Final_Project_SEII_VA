import 'coffee_recipe.dart';

class RecipeStep {
  String text;
  int time;

  RecipeStep(text, time) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    this.text = text;
    this.time = time;
  }
  static String timeDisplayed(time) {
    int sec, min;
    String minuteDisplayed, secondDisplayed;

    sec = time % 60;
    min = (time / 60).floor();

    minuteDisplayed = min.toString().length <= 1 ? "0$min" : "$min";
    secondDisplayed = sec.toString().length <= 1 ? "0$sec" : "$sec";

    return "$minuteDisplayed:$secondDisplayed";
  }

  static int totalTime(CoffeeRecipe recipe) {
    int total = 0;
    for (RecipeStep step in recipe.steps) {
      total = total + step.time;
    }
    return total;
  }
}
