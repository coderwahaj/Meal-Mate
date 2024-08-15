import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(
                      255, 88, 176, 227), // Darker shade of blue-grey
                  Color.fromARGB(255, 16, 52, 107), // Darker shade of grey-blue
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Colors.white, // Dark blue for a clean, elegant look
                ),
                SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white, // Matching text color with icon
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 26,
              color: Colors.white,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_list,
              size: 26,
              color: Colors.white,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
