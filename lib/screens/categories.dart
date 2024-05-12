import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// `with` keyword is used to mix in a mixin to the class. But... what is a mixin?
// A mixin is a class that provides methods that can be used by other classes without the need to inherit from it.
// Think of it as a way to share code between classes without using inheritance.
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // Create an AnimationController to animate the grid items.
  // late means that the variable will be initialized later.
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // 60 or 120 frames per second, depends on the device
      duration:
          const Duration(milliseconds: 300), // The duration of the animation
      lowerBound: 0.0, // The lower bound of the animation
      upperBound: 1.0, // The upper bound of the animation
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    // Dispose the animation controller to free up resources (prevents memory leaks)
    _animationController.dispose();
    super.dispose();
  }

  void selectCategory(BuildContext context, CategoryModel category) {
    var meals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: meals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AnimatedBuilder(
        animation: _animationController,
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
        builder: (context, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                  parent: _animationController, curve: Curves.easeIn),
            ),
            child: child,
          );
        },
      ),
    );
  }
}
