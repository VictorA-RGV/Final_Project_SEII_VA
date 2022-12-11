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

    // Sweet Maria's
    expect(recipes[0], isA<CoffeeRecipe>());
    expect(recipes[0].name, "Sweet Maria's");
    expect(recipes[0].steps, isA<List<RecipeStep>>());

    // Howcast Medium Ground Coffee
    expect(recipes[1], isA<CoffeeRecipe>());
    expect(recipes[1].name, "Howcast Medium Ground Coffee");
    expect(recipes[1].steps, isA<List<RecipeStep>>());

    // Mirror's Course Ground Coffee
    expect(recipes[2], isA<CoffeeRecipe>());
    expect(recipes[2].name, "Mirror's Course Ground Recipe");
    expect(recipes[2].steps, isA<List<RecipeStep>>());

    // Two Cups of Coffee
    expect(recipes[3], isA<CoffeeRecipe>());
    expect(recipes[3].name, "Two Cups of Coffee");
    expect(recipes[3].steps, isA<List<RecipeStep>>());
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

  test('Test for Howcast Medium Ground Coffee', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();
    expect(recipes[1].steps[0].text, "settle grounds until flat");
    expect(recipes[1].steps[0].time, 10);

    expect(recipes[1].steps[1].text, "Moderate pour of coffee");
    expect(recipes[1].steps[1].time, 10);

    expect(recipes[1].steps[2].text, "Cover and wait");
    expect(recipes[1].steps[2].time, 30);

    expect(recipes[1].steps[3].text, "Slow pour in circles");
    expect(recipes[1].steps[3].time, 30);

    expect(recipes[1].steps[4].text, "Stir");
    expect(recipes[1].steps[4].time, 20);
  });

  test("Test for Mirror's Course Ground Coffee", () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();
    expect(recipes[2].steps[0].text, "Add 20g ground");
    expect(recipes[2].steps[0].time, 10);

    expect(recipes[2].steps[1].text, "settle ground until flat");
    expect(recipes[2].steps[1].time, 10);

    expect(recipes[2].steps[2].text, "Add 75g water");
    expect(recipes[2].steps[2].time, 8);

    expect(recipes[2].steps[3].text, "Cover and wait");
    expect(recipes[2].steps[3].time, 30);

    expect(recipes[2].steps[4].text, "Add 245g water gentle circles");
    expect(recipes[2].steps[4].time, 30);
  });

  test("Test for Two Cups of Coffee", () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();
    expect(recipes[3].steps[0].text, "settle ground until flat");
    expect(recipes[3].steps[0].time, 10);

    expect(recipes[3].steps[1].text, "Add 100g water");
    expect(recipes[3].steps[1].time, 10);

    expect(recipes[3].steps[2].text, "Cover and wait");
    expect(recipes[3].steps[2].time, 90);

    expect(recipes[3].steps[3].text, "Add 600g water");
    expect(recipes[3].steps[3].time, 60);

    expect(recipes[3].steps[4].text, "Cover and wait");
    expect(recipes[3].steps[4].time, 60);
  });
}
