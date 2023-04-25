import 'package:flutter/material.dart';
import 'package:my_grocery/model/category.dart';

import 'popular_category_card.dart';

class PopularCategory extends StatelessWidget {
  // Declare a final list of Category objects
  final List<Category> categories;

  // Create a constructor that requires a non-null list of Category objects
  const PopularCategory({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a container with a fixed height of 140 and a right padding of 10
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          // Make the ListView scroll horizontally
          scrollDirection: Axis.horizontal,
          // Add a bouncing physics to the ListView
          physics: const BouncingScrollPhysics(),
          // Set the number of items in the ListView to the length of the categories list
          itemCount: categories.length,
          // For each index in the categories list, return a PopularCategoryCard widget with the corresponding category
          itemBuilder: (context, index) =>
              PopularCategoryCard(category: categories[index])),
    );
  }
}
