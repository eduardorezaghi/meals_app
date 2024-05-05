import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(
    const TextTheme(
      headlineLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  ),
);

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // Favorite meals
  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(Meal meal) {
    final mealExist = _favoriteMeals.contains(meal);

    if (mealExist) {
      setState(() => _favoriteMeals.remove(meal));
    } else {
      setState(() => _favoriteMeals.add(meal));
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Tabs(
        pages: 
          [
            CategoriesScreen(onToggleFavorite: _toggleFavorite),
            MealsScreen(meals: _favoriteMeals, onToggleFavorite: _toggleFavorite),
          ],
      )
    );
  }
}
