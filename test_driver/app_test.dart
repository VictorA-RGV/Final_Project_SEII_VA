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

      test('Should go through info and steps of Sweet Maria Coffee', () async {
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

        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");
        await driver.tap(doneBtn);
      }, timeout: const Timeout(Duration(seconds: 300)));
      test("Test Howcast Medium Ground Coffee", () async {
        final recipeSelectionBtn2 =
            find.byValueKey("recipe-name-Howcast Medium Ground Coffee");
        final currentStepLargeText = find.byValueKey("current-step-large-text");
        final doneBtn = find.byValueKey('done-btn');
        final startBtn = find.byValueKey('start-button');

        await driver.tap(recipeSelectionBtn2);
        await driver.tap(startBtn);
        expect(await driver.getText(currentStepLargeText), "Add 23g ground");
        await Future.delayed(const Duration(seconds: 11), () async {});

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

        await driver.tap(doneBtn);
      }, timeout: const Timeout(Duration(seconds: 300)));

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

        //On the Recipe Selection Screen, we select Sweet Maria's
        await driver.tap(recipeSelectionBtn);

        //On the Recipe Detail Screen, we expect to see the text "Sweet Maria's"
        expect(await driver.getText(recipeNameText), "Sweet Maria's");

        //If we press back button, we expect to navigate back to the Recipe Selection Screen
        await driver.tap(backBtnFinder);
      });
    });
    group('sad paths', (){
      /*test('Impatient User', ()async{
        final recipeSelectionBtn = find.byValueKey("recipe-name-Sweet Maria's");
        
        final startBtn = find.byValueKey('start-button');

        //On the Recipe Selection Screen, we select Sweet Maria's
        await driver.tap(recipeSelectionBtn);
        //On the Details Screen, we tap start
        await driver.tap(startBtn);

        // expect user to be impatient




      });*/
    });
  });
}
