import 'package:flutter/material.dart';
import 'package:meal_mate/models/meal.dart';
import 'package:meal_mate/providers/favorites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final result = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleFavoriteMeals(meal);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result
                        ? 'Meal is marked as Favorite!'
                        : 'Meal is removed from Favorites!'),
                  ),
                );
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween(begin: 0.8, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border_outlined,
                  key: ValueKey(isFavorite),
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Hero(
          tag: meal.id,
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 14),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: const Color.fromARGB(255, 83, 128, 207),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 6),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6, // Reduced vertical padding
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Icon(Icons.brightness_1,
                              size: 10), // Smaller bullet point
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            meal.ingredients[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 18, // Increase the font size here

                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: const Color.fromARGB(255, 83, 128, 207),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 6),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 2,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Icon(Icons.brightness_1, size: 10),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            meal.steps[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 18, // Increase the font size here
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
