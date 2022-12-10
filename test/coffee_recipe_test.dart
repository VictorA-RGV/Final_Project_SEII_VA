import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid coffee recipe', () {
    //make a coffee recipe

    CoffeeRecipe makeSweetMariasRecipe() {
      List<RecipeStep> steps = [
        RecipeStep("Add 360g water", 30),
        RecipeStep("Cover and wait", 90),
        RecipeStep("Stir", 15),
        RecipeStep("Cover and wait", 75),
        RecipeStep("Stir", 15),
      ];
      CoffeeRecipe recipe = CoffeeRecipe(
          "Sweet Maria's",
          22,
          360,
          "finely ground coffee",
          "The original recipe: makes one delicious cup",
          steps);
      return recipe;
    }

    List<RecipeStep> steps = [
      RecipeStep("Add 360g water", 30),
      RecipeStep("Cover and wait", 90),
      RecipeStep("Stir", 15),
      RecipeStep("Cover and wait", 75),
      RecipeStep("Stir", 15),
    ];
    //check that it has the right data
    expect(makeSweetMariasRecipe().name, "Sweet Maria's");
    expect(makeSweetMariasRecipe().grindSize, "finely ground coffee");
    expect(makeSweetMariasRecipe().coffeeVolumeGrams, 22);
    expect(makeSweetMariasRecipe().waterVolumeGrams, 360);
    expect(makeSweetMariasRecipe().miscDetails,
        "The original recipe: makes one delicious cup");
    expect(makeSweetMariasRecipe().steps[0].text, steps[0].text);
    expect(makeSweetMariasRecipe().steps[1].text, steps[1].text);
    expect(makeSweetMariasRecipe().steps[2].text, steps[2].text);
    expect(makeSweetMariasRecipe().steps[3].text, steps[3].text);
    expect(makeSweetMariasRecipe().steps[4].text, steps[4].text);

    expect(makeSweetMariasRecipe().steps[0].time, steps[0].time);
    expect(makeSweetMariasRecipe().steps[1].time, steps[1].time);
    expect(makeSweetMariasRecipe().steps[2].time, steps[2].time);
    expect(makeSweetMariasRecipe().steps[3].time, steps[3].time);
    expect(makeSweetMariasRecipe().steps[4].time, steps[4].time);
  });

// how do we test rejecting invalid coffee recipes?
// No test is needed since invalid Recipes are given ArgumentErrors.
}
