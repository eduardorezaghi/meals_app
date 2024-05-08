import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';


// Create a provider for the meals.
// What is a provider?
// - A provider is a class that provides a value to other classes.
// It shares the state with "consumers" that are interested in the value.
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
