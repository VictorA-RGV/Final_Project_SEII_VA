import 'recipe_step.dart';

class CoffeeRecipe {
  String name;
  int coffeeVolumeGrams;
  String grindSize;
  int waterVolumeGrams;
  String miscDetails;
  List<RecipeStep> steps;

  CoffeeRecipe(name, coffeeVolumeGrams, waterVolumeGrams, grindSize,
      miscDetails, steps) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    if (name == null || name == ' ') {
      throw FormatException("Empty name");
    } else
      this.name = name;

    if (coffeeVolumeGrams == null || coffeeVolumeGrams <= 0) {
      throw FormatException("Not a valid number of grams of coffee");
    } else this.coffeeVolumeGrams = coffeeVolumeGrams;

    if (waterVolumeGrams == null || waterVolumeGrams <= 0) {
      throw FormatException("Not a valid number of grams of water");
    } else this.waterVolumeGrams = waterVolumeGrams;

    if (grindSize == null || grindSize == ' ') {
      throw FormatException("Empty name");
    } else this.grindSize = grindSize;

    if (miscDetails == null || miscDetails == ' ') {
      throw FormatException("Empty name");
    } else this.miscDetails = miscDetails;

    this.steps = steps;
  }
}
