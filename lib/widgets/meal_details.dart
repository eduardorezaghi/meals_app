import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border),
            selectedIcon: const Icon(Icons.star),
            onPressed: () {
              // That's how you can read the provider and call the `toggleFavorite` method.
              // The state is NOT on the widget, it's on the provider.
              ref.read(favoriteProvider.notifier).toggleFavorite(meal);
            },
          ),
        ],
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
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            ...meal.ingredients.map((ingredient) => ListTile(
                dense: true,
                visualDensity: const VisualDensity(vertical: -4),
                title: Text(
                  ingredient,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ))),
            const SizedBox(height: 14),
            const Divider(),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            ...meal.steps.asMap().entries.map((entry) => ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -4),
                  title: Text(
                    '${entry.key + 1}. ${entry.value}',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
