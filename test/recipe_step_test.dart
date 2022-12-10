import 'dart:io';

import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

void main() {
  test('creates a valid recipe step', () {
    //make a recipe step

    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();
    

    List<RecipeStep> testSteps = recipes[0].steps;
    
    //check that it has the right data
    expect(testSteps[0].text, "Add 360g water");
    expect(testSteps[0].time, 30);
    
    expect(testSteps[1].text, "Cover and wait");
    expect(testSteps[1].time, 90);

    expect(testSteps[2].text, "Stir");
    expect(testSteps[2].time, 15);

    expect(testSteps[3].text, "Cover and wait");
    expect(testSteps[3].time, 75);

    expect(testSteps[4].text, "Stir");
    expect(testSteps[4].time, 15);
  });

  //how do we test rejecting invalid recipe steps?
}
