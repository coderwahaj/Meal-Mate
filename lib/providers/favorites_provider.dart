import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_mate/models/meal.dart';

class FavoriteMealsProvider extends StateNotifier<List<Meal>> {
  FavoriteMealsProvider() : super([]);
  bool toggleFavoriteMeals(Meal meal) {
    final isMealFavorite = state.contains(meal);
    if (isMealFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsProvider, List<Meal>>((refernece) {
  return FavoriteMealsProvider();
});
