import 'package:flutter/material.dart';
import 'package:meal_mate/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final void Function() onSelectCategory;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: onSelectCategory,
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.8),
                category.color.withOpacity(0.6),
                Colors.white.withOpacity(0.3),
              ],
              stops: const [0.0, 0.7, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(2, 2), // Shadow position
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                category.icon,
                color:
                    const Color.fromARGB(255, 195, 209, 209).withOpacity(0.8),
                size: 40,
              ),
              const SizedBox(height: 8),
              Text(
                category.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2, // Slightly increased letter spacing
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
