import 'package:flutter/material.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

const kInitialFilters = {
  FilterType.glutenFree: false,
  FilterType.vegetarian: false,
  FilterType.vegan: false,
  FilterType.lactoseFree: false,
};

class Tabs extends ConsumerStatefulWidget {
  const Tabs({
    super.key,
  });

  @override
  ConsumerState<Tabs> createState() => _TabsState();
}

class _TabsState extends ConsumerState<Tabs> {
  // States
  int _currentIndex = 0;
  Map<FilterType, bool> _filters = kInitialFilters;

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    switch (identifier) {
      case 'filters':
        await Navigator.of(context)
            .push<Map<FilterType, bool>>(
              MaterialPageRoute(
                builder: (context) => FiltersScreen(filters: _filters),
              ),
            )
            .then(
                (value) => setState(() => _filters = value ?? kInitialFilters));
        break;
      default:
        // Close the drawer on any other navigation
        Navigator.of(context).pop();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use a "ref" to access the provider.
    // A ref is a reference to a provider that allows reading the state of a provider,
    // that is, the shared state that the provider manages.
    final meals = ref.watch(mealsProvider);

    Widget currentTab = CategoriesScreen(
      availableMeals: meals,
    );

    Text currentTitle = const Text('Categories');

    final availableMeals = meals.where((meal) {
      if (_filters[FilterType.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters[FilterType.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_filters[FilterType.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_filters[FilterType.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();

    switch (_currentIndex) {
      case 1:
        final favoriteMeals = ref.watch(favoriteProvider);
        currentTitle = const Text('Favorites');
        currentTab = MealsScreen(
          meals: favoriteMeals,
        );
        break;
      case 2:
        currentTitle = const Text('Profile');
        currentTab = const Center(child: Text('Profile'));
        break;
      default:
        currentTitle = const Text('Categories');
        currentTab = CategoriesScreen(
          availableMeals: availableMeals,
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: currentTitle,
      ),
      drawer: MainDrawer(onNavigate: (identifier) => _setScreen(identifier)),
      body: currentTab,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
