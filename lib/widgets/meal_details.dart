import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Stack(children: [
        ListView(
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!
              .copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            ...meal.ingredients.map((ingredient) => 
              ListTile(
                dense: true,
                visualDensity: const VisualDensity(vertical: -4),
                title: Text(ingredient,
                style: Theme.of(context).textTheme.headlineSmall!
                .copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ))),
            const SizedBox(height: 14),
            const Divider(),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!
              .copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            ...meal.steps.asMap().entries.map((entry) => 
              ListTile(
                dense: true,
                visualDensity: const VisualDensity(vertical: -4),
                title: Text(
                  '${entry.key + 1}. ${entry.value}',
                  style: Theme.of(context).textTheme.headlineSmall!
                  .copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              )),
          ],
        )
      ]),
    );
  }
}
