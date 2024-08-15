import 'package:flutter/material.dart';
//import 'package:meal_mate/screens/tabs.dart';
//import 'package:meal_mate/wigdets/main_drawer.dart';
import 'package:meal_mate/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(
                    Filter.glutenFree,
                    isChecked,
                  );
            },
            title: Text('Lactose-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white)),
            subtitle: Text(
              'Only include Lactose-free meals!',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
            ),
            activeColor: Theme.of(context).colorScheme.tertiaryContainer,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(
                    Filter.lactoseFree,
                    isChecked,
                  );
            },
            title: Text('Vegetarian',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white)),
            subtitle: Text(
              'Only include Vegetarian meals!',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
            ),
            activeColor: Theme.of(context).colorScheme.tertiaryContainer,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(
                    Filter.vegetarian,
                    isChecked,
                  );
            },
            title: Text('Vegan Meals',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white)),
            subtitle: Text(
              'Only include Vegan meals!',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
            ),
            activeColor: Theme.of(context).colorScheme.tertiaryContainer,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(
                    Filter.vegan,
                    isChecked,
                  );
            },
            title: Text('Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white)),
            subtitle: Text(
              'Only include Gluten-free meals!',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
            ),
            activeColor: Theme.of(context).colorScheme.tertiaryContainer,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
