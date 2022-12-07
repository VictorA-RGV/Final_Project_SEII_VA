import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Align(
              alignment: Alignment.center,
              child: Text("Coffee Recipes",
                  key: Key("coffee-recipes"),
                  style: TextStyle(
                      fontFamily: 'Kollektif',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF4C748B)))),
          RecipeList(),
          Padding(
              padding: EdgeInsets.only(top: 30),
              child: Align(
                  alignment: Alignment.center,
                  child: Text("Resources",
                      style: TextStyle(
                          fontFamily: 'Kollektif',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFF4C748B))))),
          ResourceList()
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Container(
          height: 236,
          width: 350,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Color(0xFF4C748B)),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (CoffeeRecipe recipe in recipes)
                  Column(children: [
                    ListTile(
                        key: Key('recipe-name-${recipe.name}'),
                        title: Text(recipe.name,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xFF4C748B))),
                        trailing:
                            Icon(Icons.chevron_right, color: Color(0xFF4C748B)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RecipeDetailScreen(recipe)),
                          );
                        }),
                    Divider(
                        height: recipes.indexOf(recipe) == 3 ? 0 : 2,
                        thickness: recipes.indexOf(recipe) == 3 ? 0 : 1,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xFF4C748B))
                  ])
              ]),
        ));
  }
}

class ResourceList extends StatelessWidget {
  final Uri _coffeeURL = Uri.parse("https://www.amazon.com/coffee/s?k=coffee");
  final Uri _grinderURL =
      Uri.parse("https://www.amazon.com/Coffee-Grinders/b?ie=UTF8&node=289750");
  final Uri _kettleURL = Uri.parse("https://www.amazon.com/kettle/s?k=kettle");
  final Uri _homebrewDripperURL = Uri.parse(
      "https://www.amazon.com/Nuvo-Homebrew-Ceramic-Coffee-Dripper/dp/B0718XMTMZ");

  Future<void> _launchCoffeeUrl() async {
    if (!await launchUrl(_coffeeURL)) {
      throw 'Could not launch $_coffeeURL';
    }
  }

  Future<void> _launchGrinderUrl() async {
    if (!await launchUrl(_grinderURL)) {
      throw 'Could not launch $_grinderURL';
    }
  }

  Future<void> _launchKettleUrl() async {
    if (!await launchUrl(_kettleURL)) {
      throw 'Could not launch $_kettleURL';
    }
  }

  Future<void> _launchHomebrewUrl() async {
    if (!await launchUrl(_homebrewDripperURL)) {
      throw 'Could not launch $_homebrewDripperURL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Container(
            height: 236,
            width: 350,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Color(0xFF4C748B)),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: Text("Coffee",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF4C748B))),
                  trailing: Icon(Icons.chevron_right, color: Color(0xFF4C748B)),
                  onTap: _launchCoffeeUrl,
                ),
                Divider(
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: Color(0xFF4C748B)),
                ListTile(
                  title: Text("Grinders",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF4C748B))),
                  trailing: Icon(Icons.chevron_right, color: Color(0xFF4C748B)),
                  onTap: _launchGrinderUrl,
                ),
                Divider(
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: Color(0xFF4C748B)),
                ListTile(
                  title: Text("Kettles",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF4C748B))),
                  trailing: Icon(Icons.chevron_right, color: Color(0xFF4C748B)),
                  onTap: _launchKettleUrl,
                ),
                Divider(
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: Color(0xFF4C748B)),
                ListTile(
                  title: Text("Homebrew Dripper",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF4C748B))),
                  trailing: Icon(Icons.chevron_right, color: Color(0xFF4C748B)),
                  onTap: _launchHomebrewUrl,
                )
              ],
            )));
  }
}
