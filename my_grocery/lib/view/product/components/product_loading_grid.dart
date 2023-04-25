import 'package:flutter/material.dart';
import 'package:my_grocery/view/product/components/product_loading_card.dart';

class ProductLoadingGrid extends StatelessWidget {
  const ProductLoadingGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Builds a grid of product loading cards using GridView builder
    return GridView.builder(
      // Defines the layout of the grid
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      // Allows for bouncing effect when scrolling
      physics: const BouncingScrollPhysics(),
      // Adds padding to the grid
      padding: const EdgeInsets.all(10),
      // Defines the number of items in the grid, which is 6 in this case
      itemCount: 6,
      // Builds each item in the grid with a ProductLoadingCard widget
      itemBuilder: (context, index) => const ProductLoadingCard(),
    );
  }
}
