import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {

  var _mealFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border),
            selectedIcon: const Icon(Icons.star),
            isSelected: _mealFavorited,
            onPressed: () {
              widget.onToggleFavorite(widget.meal);
              setState(() => _mealFavorited = !_mealFavorited);
            }
          ),
        ],
      ),
      body: Stack(children: [
        ListView(
          children: [
            Image.network(
              widget.meal.imageUrl,
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
            ...widget.meal.ingredients.map((ingredient) => ListTile(
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
            ...widget.meal.steps.asMap().entries.map((entry) => ListTile(
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
