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
  });

  final void Function(Meal meal) onToggleFavorite;

  void selectCategory(BuildContext context, CategoryModel category) {
    var meals = dummyMeals
      .where((meal) => meal.categories.contains(category.id)).toList();

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
    return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: <Widget>[
            ...availableCategories.map((category) => CategoryGridItem(
              category: category,
              onPressed: () => selectCategory(context, category),
              )),
          ],
        );
  }
}
