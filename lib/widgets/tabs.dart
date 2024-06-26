import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  FilterType.glutenFree: false,
  FilterType.vegetarian: false,
  FilterType.vegan: false,
  FilterType.lactoseFree: false,
};

class Tabs extends StatefulWidget {
  const Tabs({
    super.key,
  });

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // States
  int _currentIndex = 0;
  Map<FilterType, bool> _filters = kInitialFilters;
  final List<Meal> _favoriteMeals = [];


  void _toggleFavorite(Meal meal) {
    final mealExist = _favoriteMeals.contains(meal);

    if (mealExist) {
      setState(() => _favoriteMeals.remove(meal));
    } else {
      setState(() => _favoriteMeals.add(meal));
    }
  }

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
    Widget _currentTab = CategoriesScreen(
      onToggleFavorite: _toggleFavorite,
      availableMeals: dummyMeals,
    );

    Text _currentTitle = const Text('Categories');

    final availableMeals = dummyMeals.where((meal) {
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
        _currentTitle = const Text('Favorites');
        _currentTab = MealsScreen(
          meals: _favoriteMeals,
          onToggleFavorite: _toggleFavorite,
        );
        break;
      case 2:
        _currentTitle = const Text('Profile');
        _currentTab = const Center(child: Text('Profile'));
        break;
      default:
        _currentTitle = const Text('Categories');
        _currentTab = CategoriesScreen(
          onToggleFavorite: _toggleFavorite,
          availableMeals: availableMeals,
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: _currentTitle,
      ),
      drawer: MainDrawer(onNavigate: (identifier) => _setScreen(identifier)),
      body: _currentTab,
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
