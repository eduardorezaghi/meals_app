import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (meals.isEmpty) {
      content = Column(
        children: [
          Text('No meals found, please check your filters!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  )),
          const SizedBox(height: 20),
          Text(
            'You can adjust your filters in the settings.',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          )
        ],
      );
    } else {
      content = ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(meals[index].title),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(meals[index].imageUrl),
          ),
        ),
        itemCount: meals.length,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: content),
    );
  }
}
