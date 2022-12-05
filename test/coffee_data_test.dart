//Test that the load recipes gives you the data you expect
//this should be dependent on the recipes that you actually want to have in the app

import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

void main() {
  test('loadRecipes should give back the recipes in my app', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    // add whatever tests help give you confidence
    expect(recipes[0], isA<CoffeeRecipe>());
    expect(recipes[0].name, "Sweet Maria's");
    expect(recipes[0].steps, isA<List<RecipeStep>>());
  });
  test('Test for Sweet Marias', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();
    expect(recipes[0].steps[0].text, "Add 360g water");
    expect(recipes[0].steps[0].time, 30);

    expect(recipes[0].steps[1].text, "Cover and wait");
    expect(recipes[0].steps[1].time, 90);

    expect(recipes[0].steps[2].text, "Stir");
    expect(recipes[0].steps[2].time, 15);

    expect(recipes[0].steps[3].text, "Cover and wait");
    expect(recipes[0].steps[3].time, 75);

    expect(recipes[0].steps[4].text, "Stir");
    expect(recipes[0].steps[4].time, 15);
  });
}
