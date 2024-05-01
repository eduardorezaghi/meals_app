import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.95),
              category.color.withOpacity(0.6)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(category.title,
          style: Theme.of(context).textTheme.titleLarge!
            .copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
        ),
      ),
    );
  }
}
