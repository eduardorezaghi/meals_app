import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void selectCategory(BuildContext context, CategoryModel category) {
    var meals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: meals,
          onToggleFavorite: (meal) => onToggleFavorite(meal),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView(
        // Use SliverGridDelegateWithFixedCrossAxisCount for a grid with a
        // fixed number of items in the cross axis.
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: <Widget>[
          // Use spread operator to add all items from the list to the grid.
          // It:
          // - generates a list of widgets from the list of available categories
          // - avoids the need to use a for loop to iterate over the list
          // - makes the code more readable
          ...availableCategories.map((category) => CategoryGridItem(
                category: category,
                onPressed: () => selectCategory(context, category),
              )),
        ],
      ),
    );
  }
}
