import 'package:flutter/material.dart';
import 'package:meal_mate/providers/favorites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_mate/screens/categories.dart';
import 'package:meal_mate/screens/filters.dart';
import 'package:meal_mate/widgets/main_drawer.dart';
import 'package:meal_mate/screens/meals.dart';
import 'package:meal_mate/providers/filters_provider.dart';

const kIntializedFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var activepagetitle = 'Categories';
  int _seletedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _seletedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      availableMeals: ref.watch(filteredMealsProvider),
    );
    var activePageTitle = 'Categories';

    if (_seletedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        onTap: _selectPage,
        currentIndex: _seletedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
