import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

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

CoffeeRecipe makeTestRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 23g ground", 10),
    RecipeStep("settle grounds until flat", 10),
    RecipeStep("Moderate pour of coffee", 10),
    RecipeStep("Cover and wait", 30),
    RecipeStep("Slow pour in circles", 30),
    RecipeStep("Stir", 20),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Howcast Medium Ground Coffee",
      23,
      400,
      "medium ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeTestRecipe2() {
  List<RecipeStep> steps = [
    RecipeStep("Add 20g ground", 10),
    RecipeStep("settle ground until flat", 10),
    RecipeStep("Add 75g water", 8),
    RecipeStep("Cover and wait", 30),
    RecipeStep("Add 245g water gentle circles", 30),
    RecipeStep("Swirl brew", 5),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Mirror's Course Ground Recipe",
      20,
      320,
      "couarse ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeTestRecipe3() {
  List<RecipeStep> steps = [
    RecipeStep("Add 52g ground", 10),
    RecipeStep("settle ground until flat", 10),
    RecipeStep("Add 100g water", 10),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Add 600g water", 60),
    RecipeStep("Cover and wait", 60),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Legitimate Question's Two Cups of Coffee",
      52,
      700,
      "medium-course ground coffee",
      "The original recipe: makes two delicious cups",
      steps);
  return recipe;
}

List<CoffeeRecipe> getAllRecipes() {
  return [
    makeSweetMariasRecipe(),
    makeTestRecipe(),
    makeTestRecipe2(),
    makeTestRecipe3(),
    
  ];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}
