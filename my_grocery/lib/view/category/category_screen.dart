import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/view/category/components/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Obx is used to update the UI when the observable changes.
      if (categoryController.categoryList.isNotEmpty) {
        // Check if the categoryList is not empty.
        return ListView.builder(
          // Build a ListView with the items of the categoryList.
          physics: const BouncingScrollPhysics(),
          itemCount: categoryController.categoryList.length,
          itemBuilder: (context, index) => CategoryCard(
              category: categoryController.categoryList[
                  index]), // Build a CategoryCard for each item in the categoryList.
        );
      } else {
        return Container(); // If the categoryList is empty, return an empty Container.
      }
    });
  }
}
