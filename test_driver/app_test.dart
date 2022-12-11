// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Homebrew Dripper App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
    });
    group('Happy Paths', () {
      /*
        Given I am on the Recipe Selection Screen
        When I tap on "Sweet Maria's recipe"
        And I am on the Recipe Detail Screen and see the steps, time, and ingredients for the coffee
        And I tap start
        And I go through all the steps for making the coffee
        Then I should see "enjoy your amazing handmade coffee"
      */

      test('Test Sweet Maria Coffee', () async {
        final recipeSelectionBtn = find.byValueKey("recipe-name-Sweet Maria's");
        final recipeNameText = find.byValueKey("recipe-name-key-Sweet Maria's");
        final recipeDataText = find.byValueKey('recipe-data-key');
        final recipeMiscDetailsText =
            find.byValueKey('recipe-miscDetails-text');
        final totalTimeText = find.byValueKey('total-time-text');
        final stepAddWater = find.byValueKey('step0');
        final timeAddWater = find.byValueKey('1-time-text');
        final stepCoverAndWait = find.byValueKey('step2');
        final timeCoverAndWait = find.byValueKey('3-time-text');
        final stepStir = find.byValueKey('step4');
        final timeStir = find.byValueKey('5-time-text');
        final stepCoverAndWait2 = find.byValueKey('step6');
        final timeCoverAndWait2 = find.byValueKey('7-time-text');
        final stepStir2 = find.byValueKey('step8');
        final timeStir2 = find.byValueKey('9-time-text');
        final startBtn = find.byValueKey('start-button');
        final currentStepLargeText = find.byValueKey("current-step-large-text");
        final doneBtn = find.byValueKey('done-btn');
        final doneScreen = find.byValueKey('enjoy-coffee-txt');
        //On the Recipe Selection Screen, we select Sweet Maria's
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Sweet Maria's"
        expect(await driver.getText(recipeNameText), "Sweet Maria's");

        //And the text "22g - finely ground coffee 360g - water"
        expect(await driver.getText(recipeDataText),
            "22g - finely ground coffee\n 360g - water");

        //And the text "The original recipe: makes one delicious cup"
        expect(await driver.getText(recipeMiscDetailsText),
            "The original recipe: makes one delicious cup");

        //And the text "Total: 03:45"
        expect(await driver.getText(totalTimeText), "Total: 03:45");

        //We expect to see the first step text "Add 360g water" With the time "00:30"
        expect(await driver.getText(stepAddWater), "Add 360g water");
        expect(await driver.getText(timeAddWater), "00:30");

        //we expect to see the next step text "Cover and wait" With the time "01:30"
        expect(await driver.getText(stepCoverAndWait), "Cover and wait");
        expect(await driver.getText(timeCoverAndWait), "01:30");

        //we expect to see the next step text "Cover and wait" With the time "00:15"
        expect(await driver.getText(stepStir), "Stir");
        expect(await driver.getText(timeStir), "00:15");

        //we expect to see the next step text "Cover and wait" With the time "1:15"
        expect(await driver.getText(stepCoverAndWait2), "Cover and wait");
        expect(await driver.getText(timeCoverAndWait2), "01:15");

        //we expect to see the next step text "Cover and wait" With the time "00:15"
        expect(await driver.getText(stepStir2), "Stir");
        expect(await driver.getText(timeStir2), "00:15");

        //If user presses start button, they will be navigated to the Recipe Steps Screen
        await driver.tap(startBtn);

        // If moved to steps screen, expect each step on current step.
        // Waits until all steps are complete
        expect(await driver.getText(currentStepLargeText), "Add 360g water");
        await Future.delayed(const Duration(seconds: 31), () async {});

        expect(await driver.getText(currentStepLargeText), "Cover and wait");
        await Future.delayed(const Duration(seconds: 91), () async {});

        expect(await driver.getText(currentStepLargeText), "Stir");
        await Future.delayed(const Duration(seconds: 16), () async {});

        expect(await driver.getText(currentStepLargeText), "Cover and wait");
        await Future.delayed(const Duration(seconds: 76), () async {});

        expect(await driver.getText(currentStepLargeText), "Stir");
        await Future.delayed(const Duration(seconds: 16), () async {});

        // We expect to be at the done screen
        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");
        await driver.tap(doneBtn);
      }, timeout: const Timeout(Duration(seconds: 300)));

      /*
        Given I am on the Recipe Selection Screen
        When I tap on "Howcast Medium Ground Coffee"
        And I am on the Recipe Detail Screen and see the steps, time, and ingredients for the coffee
        And I tap start
        And I go through all the steps for making the coffee
        Then I should see "enjoy your amazing handmade coffee"
      */
      test("Test Howcast Medium Ground Coffee", () async {
        final recipeSelectionBtn =
            find.byValueKey("recipe-name-Howcast Medium Ground Coffee");
        final currentStepLargeText = find.byValueKey("current-step-large-text");
        final doneScreen = find.byValueKey('enjoy-coffee-txt');
        final doneBtn = find.byValueKey('done-btn');
        final startBtn = find.byValueKey('start-button');
        final recipeNameText =
            find.byValueKey("recipe-name-key-Howcast Medium Ground Coffee");
        final recipeDataText = find.byValueKey('recipe-data-key');
        final recipeMiscDetailsText =
            find.byValueKey('recipe-miscDetails-text');
        final totalTimeText = find.byValueKey('total-time-text');
        final step1 = find.byValueKey('step0');
        final time1 = find.byValueKey('1-time-text');
        final step2 = find.byValueKey('step2');
        final time2 = find.byValueKey('3-time-text');
        final step3 = find.byValueKey('step4');
        final time3 = find.byValueKey('5-time-text');
        final step4 = find.byValueKey('step6');
        final time4 = find.byValueKey('7-time-text');
        final step5 = find.byValueKey('step8');
        final time5 = find.byValueKey('9-time-text');

        // Tap on the Howcast Recipe and go to Recipe Detail Screen
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Howcast Medium Ground Coffee"
        expect(await driver.getText(recipeNameText),
            "Howcast Medium Ground Coffee");

        //And the text "23g - medium ground coffee 400g - water"
        expect(await driver.getText(recipeDataText),
            "23g - medium ground coffee\n 400g - water");

        //And the text "The original recipe: makes one delicious cup"
        expect(await driver.getText(recipeMiscDetailsText),
            "The original recipe: makes one delicious cup");

        //And the text "Total: 01:40"
        expect(await driver.getText(totalTimeText), "Total: 01:40");

        //We expect to see the first step text "settle grounds until flat" With the time "00:10"
        expect(await driver.getText(step1), "settle grounds until flat");
        expect(await driver.getText(time1), "00:10");

        //we expect to see the next step text "Moderate pour of coffee" With the time "00:10"
        expect(await driver.getText(step2), "Moderate pour of coffee");
        expect(await driver.getText(time2), "00:10");

        //we expect to see the next step text "Cover and wait" With the time "00:30"
        expect(await driver.getText(step3), "Cover and wait");
        expect(await driver.getText(time3), "00:30");

        //we expect to see the next step text "Slow pour in circles" With the time "00:30"
        expect(await driver.getText(step4), "Slow pour in circles");
        expect(await driver.getText(time4), "00:30");

        //we expect to see the next step text "Stir" With the time "00:20"
        expect(await driver.getText(step5), "Stir");
        expect(await driver.getText(time5), "00:20");

        // Tap on the start button
        await driver.tap(startBtn);

        // If moved to steps screen, expect each step on current step.
        // Waits until all steps are complete
        expect(await driver.getText(currentStepLargeText),
            "settle grounds until flat");
        await Future.delayed(const Duration(seconds: 11), () async {});

        expect(await driver.getText(currentStepLargeText),
            "Moderate pour of coffee");
        await Future.delayed(const Duration(seconds: 11), () async {});

        expect(await driver.getText(currentStepLargeText), "Cover and wait");
        await Future.delayed(const Duration(seconds: 31), () async {});

        expect(
            await driver.getText(currentStepLargeText), "Slow pour in circles");
        await Future.delayed(const Duration(seconds: 31), () async {});

        expect(await driver.getText(currentStepLargeText), "Stir");
        await Future.delayed(const Duration(seconds: 21), () async {});

        // We expect to be at the done screen
        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");
        await driver.tap(doneBtn);
      }, timeout: const Timeout(Duration(seconds: 300)));

      /*
        Given I am on the Recipe Selection Screen
        When I tap on "Mirror's Course Ground Recipe"
        And I am on the Recipe Detail Screen and see the steps, time, and ingredients for the coffee
        And I tap start
        And I go through all the steps for making the coffee
        Then I should see "enjoy your amazing handmade coffee"
      */

      test("Test Mirror's Course Ground Recipe", () async {
        final recipeSelectionBtn =
            find.byValueKey("recipe-name-Mirror's Course Ground Recipe");
        final currentStepLargeText = find.byValueKey("current-step-large-text");
        final doneScreen = find.byValueKey('enjoy-coffee-txt');
        final doneBtn = find.byValueKey('done-btn');
        final startBtn = find.byValueKey('start-button');
        final recipeNameText =
            find.byValueKey("recipe-name-key-Mirror's Course Ground Recipe");
        final recipeDataText = find.byValueKey('recipe-data-key');
        final recipeMiscDetailsText =
            find.byValueKey('recipe-miscDetails-text');
        final totalTimeText = find.byValueKey('total-time-text');
        final step1 = find.byValueKey('step0');
        final time1 = find.byValueKey('1-time-text');
        final step2 = find.byValueKey('step2');
        final time2 = find.byValueKey('3-time-text');
        final step3 = find.byValueKey('step4');
        final time3 = find.byValueKey('5-time-text');
        final step4 = find.byValueKey('step6');
        final time4 = find.byValueKey('7-time-text');
        final step5 = find.byValueKey('step8');
        final time5 = find.byValueKey('9-time-text');

        // Tap on the Mirror's Course Ground Recipe and go to Recipe Detail Screen
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Mirror's Course Ground Recipe"
        expect(await driver.getText(recipeNameText),
            "Mirror's Course Ground Recipe");

        //And the text "20g - course ground coffee 320g - water"
        expect(await driver.getText(recipeDataText),
            "20g - course ground coffee\n 320g - water");

        //And the text "The original recipe: makes one delicious cup"
        expect(await driver.getText(recipeMiscDetailsText),
            "The original recipe: makes one delicious cup");

        //And the text "Total: 01:28"
        expect(await driver.getText(totalTimeText), "Total: 01:28");

        //We expect to see the first step text "Add 20g ground" With the time "00:10"
        expect(await driver.getText(step1), "Add 20g ground");
        expect(await driver.getText(time1), "00:10");

        //we expect to see the next step text "settle ground until flat" With the time "00:10"
        expect(await driver.getText(step2), "settle ground until flat");
        expect(await driver.getText(time2), "00:10");

        //we expect to see the next step text "Add 75g water" With the time "00:08"
        expect(await driver.getText(step3), "Add 75g water");
        expect(await driver.getText(time3), "00:08");

        //we expect to see the next step text "Cover and wait" With the time "00:30"
        expect(await driver.getText(step4), "Cover and wait");
        expect(await driver.getText(time4), "00:30");

        //we expect to see the next step text "Add 245g water gentle circles" With the time "00:30"
        expect(await driver.getText(step5), "Add 245g water gentle circles");
        expect(await driver.getText(time5), "00:30");

        // Tap on the start button
        await driver.tap(startBtn);

        // If moved to steps screen, expect each step on current step.
        // Waits until all steps are complete
        expect(await driver.getText(currentStepLargeText), "Add 20g ground");
        await Future.delayed(const Duration(seconds: 11), () async {});

        expect(await driver.getText(currentStepLargeText),
            "settle ground until flat");
        await Future.delayed(const Duration(seconds: 11), () async {});

        expect(await driver.getText(currentStepLargeText), "Add 75g water");
        await Future.delayed(const Duration(seconds: 9), () async {});

        expect(await driver.getText(currentStepLargeText), "Cover and wait");
        await Future.delayed(const Duration(seconds: 31), () async {});

        expect(await driver.getText(currentStepLargeText),
            "Add 245g water gentle circles");
        await Future.delayed(const Duration(seconds: 31), () async {});

        // We expect to be at the done screen
        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");
        await driver.tap(doneBtn);
      }, timeout: const Timeout(Duration(seconds: 300)));

      /*
        Given I am on the Recipe Selection Screen
        When I tap on "Two Cups of Coffee"
        And I am on the Recipe Detail Screen and see the steps, time, and ingredients for the coffee
        And I tap start
        And I go through all the steps for making the coffee
        Then I should see "enjoy your amazing handmade coffee"
      */

      test("Test Two Cups of Coffee", () async {
        final recipeSelectionBtn =
            find.byValueKey("recipe-name-Two Cups of Coffee");
        final currentStepLargeText = find.byValueKey("current-step-large-text");
        final doneScreen = find.byValueKey('enjoy-coffee-txt');
        final doneBtn = find.byValueKey('done-btn');
        final startBtn = find.byValueKey('start-button');
        final recipeNameText =
            find.byValueKey("recipe-name-key-Two Cups of Coffee");
        final recipeDataText = find.byValueKey('recipe-data-key');
        final recipeMiscDetailsText =
            find.byValueKey('recipe-miscDetails-text');
        final totalTimeText = find.byValueKey('total-time-text');
        final step1 = find.byValueKey('step0');
        final time1 = find.byValueKey('1-time-text');
        final step2 = find.byValueKey('step2');
        final time2 = find.byValueKey('3-time-text');
        final step3 = find.byValueKey('step4');
        final time3 = find.byValueKey('5-time-text');
        final step4 = find.byValueKey('step6');
        final time4 = find.byValueKey('7-time-text');
        final step5 = find.byValueKey('step8');
        final time5 = find.byValueKey('9-time-text');

        // Tap on the Two Cups of Coffee and go to Recipe Detail Screen
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Two Cups of Coffee"
        expect(await driver.getText(recipeNameText), "Two Cups of Coffee");

        //And the text "52g - medium-course ground coffee 700g - water"
        expect(await driver.getText(recipeDataText),
            "52g - medium-course ground coffee\n 700g - water");

        //And the text "The original recipe: makes two delicious cups"
        expect(await driver.getText(recipeMiscDetailsText),
            "The original recipe: makes two delicious cups");

        //And the text "Total: 03:50"
        expect(await driver.getText(totalTimeText), "Total: 03:50");

        //We expect to see the first step text "settle ground until flat" With the time "00:10"
        expect(await driver.getText(step1), "settle ground until flat");
        expect(await driver.getText(time1), "00:10");

        //we expect to see the next step text "Add 100g water" With the time "00:10"
        expect(await driver.getText(step2), "Add 100g water");
        expect(await driver.getText(time2), "00:10");

        //we expect to see the next step text "Cover and wait" With the time "01:30"
        expect(await driver.getText(step3), "Cover and wait");
        expect(await driver.getText(time3), "01:30");

        //we expect to see the next step text "Add 600g water" With the time "01:00"
        expect(await driver.getText(step4), "Add 600g water");
        expect(await driver.getText(time4), "01:00");

        //we expect to see the next step text "Cover and wait" With the time "01:00"
        expect(await driver.getText(step5), "Cover and wait");
        expect(await driver.getText(time5), "01:00");

        // Tap on the start button
        await driver.tap(startBtn);

        // If moved to steps screen, expect each step on current step.
        // Waits until all steps are complete
        expect(await driver.getText(currentStepLargeText),
            "settle ground until flat");
        await Future.delayed(const Duration(seconds: 11), () async {});

        expect(await driver.getText(currentStepLargeText), "Add 100g water");
        await Future.delayed(const Duration(seconds: 11), () async {});

        expect(await driver.getText(currentStepLargeText), "Cover and wait");
        await Future.delayed(const Duration(seconds: 91), () async {});

        expect(await driver.getText(currentStepLargeText), "Add 600g water");
        await Future.delayed(const Duration(seconds: 61), () async {});

        expect(await driver.getText(currentStepLargeText), "Cover and wait");
        await Future.delayed(const Duration(seconds: 61), () async {});

        // We expect to be at the done screen
        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");
        await driver.tap(doneBtn);
      }, timeout: const Timeout(Duration(seconds: 300)));
    });

    group('sad paths', () {
      /*
        Given I am on the Recipe Selection Screen
        And I tap on "Sweet Maria's recipe"
        And I am on the Recipe Detail Screen and see the steps, time, and ingredients for the coffee
        When I tap start
        Then I should see '30'
        And I should see "Add 360g water"
        When 30 seconds has not passed
        Then I should still see "Add 360g water"
        And go through all the steps until finished
      */

      test('Impatient User on Sweet Maria Coffee', () async {
        final recipeSelectionBtn = find.byValueKey("recipe-name-Sweet Maria's");
        final recipeNameText = find.byValueKey("recipe-name-key-Sweet Maria's");
        final recipeDataText = find.byValueKey('recipe-data-key');
        final recipeMiscDetailsText =
            find.byValueKey('recipe-miscDetails-text');
        final totalTimeText = find.byValueKey('total-time-text');
        final stepAddWater = find.byValueKey('step0');
        final timeAddWater = find.byValueKey('1-time-text');
        final stepCoverAndWait = find.byValueKey('step2');
        final timeCoverAndWait = find.byValueKey('3-time-text');
        final stepStir = find.byValueKey('step4');
        final timeStir = find.byValueKey('5-time-text');
        final stepCoverAndWait2 = find.byValueKey('step6');
        final timeCoverAndWait2 = find.byValueKey('7-time-text');
        final stepStir2 = find.byValueKey('step8');
        final timeStir2 = find.byValueKey('9-time-text');
        final startBtn = find.byValueKey('start-button');
        final currentStepLargeText = find.byValueKey("current-step-large-text");
        final doneBtn = find.byValueKey('done-btn');
        final doneScreen = find.byValueKey('enjoy-coffee-txt');
        //On the Recipe Selection Screen, we select Sweet Maria's
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Sweet Maria's"
        expect(await driver.getText(recipeNameText), "Sweet Maria's");

        //And the text "22g - finely ground coffee 360g - water"
        expect(await driver.getText(recipeDataText),
            "22g - finely ground coffee\n 360g - water");

        //And the text "The original recipe: makes one delicious cup"
        expect(await driver.getText(recipeMiscDetailsText),
            "The original recipe: makes one delicious cup");

        //And the text "Total: 03:45"
        expect(await driver.getText(totalTimeText), "Total: 03:45");

        //We expect to see the first step text "Add 360g water" With the time "00:30"
        expect(await driver.getText(stepAddWater), "Add 360g water");
        expect(await driver.getText(timeAddWater), "00:30");

        //we expect to see the next step text "Cover and wait" With the time "01:30"
        expect(await driver.getText(stepCoverAndWait), "Cover and wait");
        expect(await driver.getText(timeCoverAndWait), "01:30");

        //we expect to see the next step text "Cover and wait" With the time "00:15"
        expect(await driver.getText(stepStir), "Stir");
        expect(await driver.getText(timeStir), "00:15");

        //we expect to see the next step text "Cover and wait" With the time "1:15"
        expect(await driver.getText(stepCoverAndWait2), "Cover and wait");
        expect(await driver.getText(timeCoverAndWait2), "01:15");

        //we expect to see the next step text "Cover and wait" With the time "00:15"
        expect(await driver.getText(stepStir2), "Stir");
        expect(await driver.getText(timeStir2), "00:15");

        //If user presses start button, they will be navigated to the Recipe Steps Screen
        await driver.tap(startBtn);

        // Go through the steps
        // Pass around 15 seconds
        expect(await driver.getText(currentStepLargeText), "Add 360g water");
        await Future.delayed(const Duration(seconds: 16), () async {});

        // We expect to still see "Add 360g water"
        expect(await driver.getText(currentStepLargeText), "Add 360g water");

        // Pass time until next step
        await Future.delayed(const Duration(seconds: 15), () async {});

        // Continue with the rest of the steps
        expect(await driver.getText(currentStepLargeText), "Cover and wait");
        await Future.delayed(const Duration(seconds: 91), () async {});

        expect(await driver.getText(currentStepLargeText), "Stir");
        await Future.delayed(const Duration(seconds: 16), () async {});

        expect(await driver.getText(currentStepLargeText), "Cover and wait");
        await Future.delayed(const Duration(seconds: 76), () async {});

        expect(await driver.getText(currentStepLargeText), "Stir");
        await Future.delayed(const Duration(seconds: 16), () async {});

        // We expect to be at the done screen
        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");
        await driver.tap(doneBtn);
      }, timeout: const Timeout(Duration(seconds: 300)));

      /*
        Given I am on the Recipe Selection Screen
        And I tap on "Howcast Medium Ground Coffee"
        And I am on the Recipe Detail Screen and see the steps, time, and ingredients for the coffee
        When I tap start
        Then I should see '10'
        And I should see "settle grounds until flat"
        When 10 seconds has not passed
        Then I should still see "settle grounds until flat"
        And go through all the steps until finished
      */
      test("Impatient User on Howcast Medium Ground Coffee", () async {
        final recipeSelectionBtn =
            find.byValueKey("recipe-name-Howcast Medium Ground Coffee");
        final currentStepLargeText = find.byValueKey("current-step-large-text");
        final doneScreen = find.byValueKey('enjoy-coffee-txt');
        final doneBtn = find.byValueKey('done-btn');
        final startBtn = find.byValueKey('start-button');
        final recipeNameText =
            find.byValueKey("recipe-name-key-Howcast Medium Ground Coffee");
        final recipeDataText = find.byValueKey('recipe-data-key');
        final recipeMiscDetailsText =
            find.byValueKey('recipe-miscDetails-text');
        final totalTimeText = find.byValueKey('total-time-text');
        final step1 = find.byValueKey('step0');
        final time1 = find.byValueKey('1-time-text');
        final step2 = find.byValueKey('step2');
        final time2 = find.byValueKey('3-time-text');
        final step3 = find.byValueKey('step4');
        final time3 = find.byValueKey('5-time-text');
        final step4 = find.byValueKey('step6');
        final time4 = find.byValueKey('7-time-text');
        final step5 = find.byValueKey('step8');
        final time5 = find.byValueKey('9-time-text');

        // Tap on the Howcast Recipe and go to Recipe Detail Screen
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Howcast Medium Ground Coffee"
        expect(await driver.getText(recipeNameText),
            "Howcast Medium Ground Coffee");

        //And the text "23g - medium ground coffee 400g - water"
        expect(await driver.getText(recipeDataText),
            "23g - medium ground coffee\n 400g - water");

        //And the text "The original recipe: makes one delicious cup"
        expect(await driver.getText(recipeMiscDetailsText),
            "The original recipe: makes one delicious cup");

        //And the text "Total: 01:40"
        expect(await driver.getText(totalTimeText), "Total: 01:40");

        //We expect to see the first step text "settle grounds until flat" With the time "00:10"
        expect(await driver.getText(step1), "settle grounds until flat");
        expect(await driver.getText(time1), "00:10");

        //we expect to see the next step text "Moderate pour of coffee" With the time "00:10"
        expect(await driver.getText(step2), "Moderate pour of coffee");
        expect(await driver.getText(time2), "00:10");

        //we expect to see the next step text "Cover and wait" With the time "00:30"
        expect(await driver.getText(step3), "Cover and wait");
        expect(await driver.getText(time3), "00:30");

        //we expect to see the next step text "Slow pour in circles" With the time "00:30"
        expect(await driver.getText(step4), "Slow pour in circles");
        expect(await driver.getText(time4), "00:30");

        //we expect to see the next step text "Stir" With the time "00:20"
        expect(await driver.getText(step5), "Stir");
        expect(await driver.getText(time5), "00:20");

        // Tap on the start button
        await driver.tap(startBtn);

        // Go through the steps
        // Pass around 7 seconds
        expect(await driver.getText(currentStepLargeText),
            "settle grounds until flat");
        await Future.delayed(const Duration(seconds: 8), () async {});

        // We expect to still see "settle grounds until flat"
        expect(await driver.getText(currentStepLargeText),
            "settle grounds until flat");

        // Pass time until next step
        await Future.delayed(const Duration(seconds: 3), () async {});

        // Continue with the rest of the steps
        expect(await driver.getText(currentStepLargeText),
            "Moderate pour of coffee");
        await Future.delayed(const Duration(seconds: 11), () async {});

        expect(await driver.getText(currentStepLargeText), "Cover and wait");
        await Future.delayed(const Duration(seconds: 31), () async {});

        expect(
            await driver.getText(currentStepLargeText), "Slow pour in circles");
        await Future.delayed(const Duration(seconds: 31), () async {});

        expect(await driver.getText(currentStepLargeText), "Stir");
        await Future.delayed(const Duration(seconds: 21), () async {});

        // We expect to be at the done screen
        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");
        await driver.tap(doneBtn);
      }, timeout: const Timeout(Duration(seconds: 300)));

      /*
        Given I am on the Recipe Selection Screen
        And I tap on "Mirror's Course Ground Coffee"
        And I am on the Recipe Detail Screen and see the steps, time, and ingredients for the coffee
        When I tap start
        Then I should see '10'
        And I should see "Add 20g ground"
        When 10 seconds has not passed
        Then I should still see "Add 20g ground"
        And go through all the steps until finished
      */

      test("Impatient User on Mirror's Course Ground Recipe", () async {
        final recipeSelectionBtn =
            find.byValueKey("recipe-name-Mirror's Course Ground Recipe");
        final currentStepLargeText = find.byValueKey("current-step-large-text");
        final doneScreen = find.byValueKey('enjoy-coffee-txt');
        final doneBtn = find.byValueKey('done-btn');
        final startBtn = find.byValueKey('start-button');
        final recipeNameText =
            find.byValueKey("recipe-name-key-Mirror's Course Ground Recipe");
        final recipeDataText = find.byValueKey('recipe-data-key');
        final recipeMiscDetailsText =
            find.byValueKey('recipe-miscDetails-text');
        final totalTimeText = find.byValueKey('total-time-text');
        final step1 = find.byValueKey('step0');
        final time1 = find.byValueKey('1-time-text');
        final step2 = find.byValueKey('step2');
        final time2 = find.byValueKey('3-time-text');
        final step3 = find.byValueKey('step4');
        final time3 = find.byValueKey('5-time-text');
        final step4 = find.byValueKey('step6');
        final time4 = find.byValueKey('7-time-text');
        final step5 = find.byValueKey('step8');
        final time5 = find.byValueKey('9-time-text');

        // Tap on the Mirror's Course Ground Recipe and go to Recipe Detail Screen
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Mirror's Course Ground Recipe"
        expect(await driver.getText(recipeNameText),
            "Mirror's Course Ground Recipe");

        //And the text "20g - course ground coffee 320g - water"
        expect(await driver.getText(recipeDataText),
            "20g - course ground coffee\n 320g - water");

        //And the text "The original recipe: makes one delicious cup"
        expect(await driver.getText(recipeMiscDetailsText),
            "The original recipe: makes one delicious cup");

        //And the text "Total: 01:28"
        expect(await driver.getText(totalTimeText), "Total: 01:28");

        //We expect to see the first step text "Add 20g ground" With the time "00:10"
        expect(await driver.getText(step1), "Add 20g ground");
        expect(await driver.getText(time1), "00:10");

        //we expect to see the next step text "settle ground until flat" With the time "00:10"
        expect(await driver.getText(step2), "settle ground until flat");
        expect(await driver.getText(time2), "00:10");

        //we expect to see the next step text "Add 75g water" With the time "00:08"
        expect(await driver.getText(step3), "Add 75g water");
        expect(await driver.getText(time3), "00:08");

        //we expect to see the next step text "Cover and wait" With the time "00:30"
        expect(await driver.getText(step4), "Cover and wait");
        expect(await driver.getText(time4), "00:30");

        //we expect to see the next step text "Add 245g water gentle circles" With the time "00:30"
        expect(await driver.getText(step5), "Add 245g water gentle circles");
        expect(await driver.getText(time5), "00:30");

        // Tap on the start button
        await driver.tap(startBtn);

        // Go through the steps
        // Pass around 5 seconds
        expect(await driver.getText(currentStepLargeText), "Add 20g ground");
        await Future.delayed(const Duration(seconds: 6), () async {});

        // We expect to still see "Add 20g ground"
        expect(await driver.getText(currentStepLargeText), "Add 20g ground");

        // Pass time until next step
        await Future.delayed(const Duration(seconds: 5), () async {});

        // Continue with the rest of the steps
        expect(await driver.getText(currentStepLargeText),
            "settle ground until flat");
        await Future.delayed(const Duration(seconds: 11), () async {});

        expect(await driver.getText(currentStepLargeText), "Add 75g water");
        await Future.delayed(const Duration(seconds: 9), () async {});

        expect(await driver.getText(currentStepLargeText), "Cover and wait");
        await Future.delayed(const Duration(seconds: 31), () async {});

        expect(await driver.getText(currentStepLargeText),
            "Add 245g water gentle circles");
        await Future.delayed(const Duration(seconds: 31), () async {});

        // We expect to be at the done screen
        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");
        await driver.tap(doneBtn);
      }, timeout: const Timeout(Duration(seconds: 300)));

      /*
        Given I am on the Recipe Selection Screen
        And I tap on "Two Cups of Coffee"
        And I am on the Recipe Detail Screen and see the steps, time, and ingredients for the coffee
        When I tap start
        Then I should see '10'
        And I should see "settle ground until flat"
        When 10 seconds has not passed
        Then I should still see "settle ground until flat"
        And go through all the steps until finished
      */

      test("Impatient User on Two Cups of Coffee", () async {
        final recipeSelectionBtn =
            find.byValueKey("recipe-name-Two Cups of Coffee");
        final currentStepLargeText = find.byValueKey("current-step-large-text");
        final doneScreen = find.byValueKey('enjoy-coffee-txt');
        final doneBtn = find.byValueKey('done-btn');
        final startBtn = find.byValueKey('start-button');
        final recipeNameText =
            find.byValueKey("recipe-name-key-Two Cups of Coffee");
        final recipeDataText = find.byValueKey('recipe-data-key');
        final recipeMiscDetailsText =
            find.byValueKey('recipe-miscDetails-text');
        final totalTimeText = find.byValueKey('total-time-text');
        final step1 = find.byValueKey('step0');
        final time1 = find.byValueKey('1-time-text');
        final step2 = find.byValueKey('step2');
        final time2 = find.byValueKey('3-time-text');
        final step3 = find.byValueKey('step4');
        final time3 = find.byValueKey('5-time-text');
        final step4 = find.byValueKey('step6');
        final time4 = find.byValueKey('7-time-text');
        final step5 = find.byValueKey('step8');
        final time5 = find.byValueKey('9-time-text');

        // Tap on the Two Cups of Coffee and go to Recipe Detail Screen
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Two Cups of Coffee"
        expect(await driver.getText(recipeNameText), "Two Cups of Coffee");

        //And the text "52g - medium-course ground coffee 700g - water"
        expect(await driver.getText(recipeDataText),
            "52g - medium-course ground coffee\n 700g - water");

        //And the text "The original recipe: makes two delicious cups"
        expect(await driver.getText(recipeMiscDetailsText),
            "The original recipe: makes two delicious cups");

        //And the text "Total: 03:50"
        expect(await driver.getText(totalTimeText), "Total: 03:50");

        //We expect to see the first step text "settle ground until flat" With the time "00:10"
        expect(await driver.getText(step1), "settle ground until flat");
        expect(await driver.getText(time1), "00:10");

        //we expect to see the next step text "Add 100g water" With the time "00:10"
        expect(await driver.getText(step2), "Add 100g water");
        expect(await driver.getText(time2), "00:10");

        //we expect to see the next step text "Cover and wait" With the time "01:30"
        expect(await driver.getText(step3), "Cover and wait");
        expect(await driver.getText(time3), "01:30");

        //we expect to see the next step text "Add 600g water" With the time "01:00"
        expect(await driver.getText(step4), "Add 600g water");
        expect(await driver.getText(time4), "01:00");

        //we expect to see the next step text "Cover and wait" With the time "01:00"
        expect(await driver.getText(step5), "Cover and wait");
        expect(await driver.getText(time5), "01:00");

        // Tap on the start button
        await driver.tap(startBtn);

        // Go through the steps
        // Pass around 8 seconds
        expect(await driver.getText(currentStepLargeText),
            "settle ground until flat");
        await Future.delayed(const Duration(seconds: 9), () async {});

        // We expect to still see "settle ground until flat"
        expect(await driver.getText(currentStepLargeText),
            "settle ground until flat");

        // Pass time until next step
        await Future.delayed(const Duration(seconds: 2), () async {});

        // Continue with the rest of the steps
        expect(await driver.getText(currentStepLargeText), "Add 100g water");
        await Future.delayed(const Duration(seconds: 11), () async {});

        expect(await driver.getText(currentStepLargeText), "Cover and wait");
        await Future.delayed(const Duration(seconds: 91), () async {});

        expect(await driver.getText(currentStepLargeText), "Add 600g water");
        await Future.delayed(const Duration(seconds: 61), () async {});

        expect(await driver.getText(currentStepLargeText), "Cover and wait");
        await Future.delayed(const Duration(seconds: 61), () async {});

        // We expect to be at the done screen
        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");
        await driver.tap(doneBtn);
      }, timeout: const Timeout(Duration(seconds: 300)));
    });

    group('back button', () {
      /*
        Given I am on the Recipe Selection Screen
        When I tap on "Sweet Maria's"
        And I am on the Recipe Detail Screen"
        Then when I tap on the back button, I should be on the Recipe Selection Screen
      */

      test('Sweet Maria Back Button on Recipe Detail Screen', () async {
        final recipeSelectionBtn = find.byValueKey("recipe-name-Sweet Maria's");
        final recipeNameText = find.byValueKey("recipe-name-key-Sweet Maria's");
        final backBtnFinder = find.byValueKey('back-arrow-button');
        final coffeeRecipesText = find.byValueKey("coffee-recipes");

        //On the Recipe Selection Screen, we select Sweet Maria's
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Sweet Maria's"
        expect(await driver.getText(recipeNameText), "Sweet Maria's");

        //Press back button
        await driver.tap(backBtnFinder);

        //We expect to navigate back to the Recipe Selection Screen
        expect(await driver.getText(coffeeRecipesText), "Coffee Recipes");
      });

      /*
        Given I am on the Recipe Selection Screen
        When I tap on "Howcast Medium Ground Coffee"
        And I am on the Recipe Detail Screen"
        Then when I tap on the back button, I should be on the Recipe Selection Screen
      */

      test('Howcast Back Button on Recipe Detail Screen', () async {
        final recipeSelectionBtn =
            find.byValueKey("recipe-name-Howcast Medium Ground Coffee");
        final recipeNameText =
            find.byValueKey("recipe-name-key-Howcast Medium Ground Coffee");
        final backBtnFinder = find.byValueKey('back-arrow-button');
        final coffeeRecipesText = find.byValueKey("coffee-recipes");

        //On the Recipe Selection Screen, we select Howcast Medium Ground Coffee
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Howcast Medium Ground Coffee"
        expect(await driver.getText(recipeNameText),
            "Howcast Medium Ground Coffee");

        //Press back button
        await driver.tap(backBtnFinder);

        //We expect to navigate back to the Recipe Selection Screen
        expect(await driver.getText(coffeeRecipesText), "Coffee Recipes");
      });

      /*
        Given I am on the Recipe Selection Screen
        When I tap on "Mirror's Course Ground Recipe"
        And I am on the Recipe Detail Screen"
        Then when I tap on the back button, I should be on the Recipe Selection Screen
      */

      test("Mirror's Back Button on Recipe Detail Screen", () async {
        final recipeSelectionBtn =
            find.byValueKey("recipe-name-Mirror's Course Ground Recipe");
        final recipeNameText =
            find.byValueKey("recipe-name-key-Mirror's Course Ground Recipe");
        final backBtnFinder = find.byValueKey('back-arrow-button');
        final coffeeRecipesText = find.byValueKey("coffee-recipes");

        //On the Recipe Selection Screen, we select Mirror's Course Ground Coffee
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Mirror's Course Ground Coffee"
        expect(await driver.getText(recipeNameText),
            "Mirror's Course Ground Recipe");

        //Press back button
        await driver.tap(backBtnFinder);

        //We expect to navigate back to the Recipe Selection Screen
        expect(await driver.getText(coffeeRecipesText), "Coffee Recipes");
      });

      /*
        Given I am on the Recipe Selection Screen
        When I tap on "Two Cups of Coffee"
        And I am on the Recipe Detail Screen"
        Then when I tap on the back button, I should be on the Recipe Selection Screen
      */

      test("Two Cups Back Button on Recipe Detail Screen", () async {
        final recipeSelectionBtn =
            find.byValueKey("recipe-name-Two Cups of Coffee");
        final recipeNameText =
            find.byValueKey("recipe-name-key-Two Cups of Coffee");
        final backBtnFinder = find.byValueKey('back-arrow-button');
        final coffeeRecipesText = find.byValueKey("coffee-recipes");

        //On the Recipe Selection Screen, we select Two Cups of Coffee
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Two Cups of Coffee"
        expect(await driver.getText(recipeNameText), "Two Cups of Coffee");

        //Press back button
        await driver.tap(backBtnFinder);

        //We expect to navigate back to the Recipe Selection Screen
        expect(await driver.getText(coffeeRecipesText), "Coffee Recipes");
      });
    });
  });
}
