import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

// This is a StateNotifier that manages a list of favorite meals.
// This is a simple example of how to use StateNotifier to manage a list of
// items that can be toggled on and off.
class FavoriteProvider extends StateNotifier<List<Meal>> {
  // Initialize the state with an empty list.
  FavoriteProvider() : super([]);

  void toggleFavorite(Meal meal) {
    // What is `state`?
    // `state` is a getter that returns the current state of the notifier.
    final mealExist = state.contains(meal);

    // WHY CREATE A COPY OF state?
    // You should always create a copy of the state when updating it.
    // This is because Riverpod will only notify listeners if the state object
    // changes, not if the contents of the state object change.
    if (mealExist) {
      state = List.from(state)..remove(meal);
    } else {
      state = List.from(state)..add(meal);
    }
  }
}


final favoriteProvider = 
  // What is StateNotifierProvider?
  // This provider is used to create a provider that exposes a [StateNotifier].
  // This is useful for managing complex state that is composed of multiple
  // values, and that is not easily represented as a single value.
  // The [StateNotifier] must be a [StateNotifier] subclass.
  StateNotifierProvider<FavoriteProvider, List<Meal>>(
    (ref) => FavoriteProvider(),
);