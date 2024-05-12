import 'package:flutter/material.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider for changes
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adjust your meal selection'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text('Gluten-free'),
            subtitle: const Text('Only include gluten-free meals.'),
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, value);
            },
          ),
          SwitchListTile(
            title: const Text('Vegetarian'),
            subtitle: const Text('Only include vegetarian meals.'),
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, value);
            },
          ),
          SwitchListTile(
            title: const Text('Vegan'),
            subtitle: const Text('Only include vegan meals.'),
            value: activeFilters[Filter.vegan]!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, value);
            },
          ),
          SwitchListTile(
            title: const Text('Lactose-free'),
            subtitle: const Text('Only include lactose-free meals.'),
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, value);
            },
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
