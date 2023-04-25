import 'package:flutter/material.dart';
import 'package:my_grocery/view/product/components/product_card.dart'; // import the product card component
import '../../../model/product.dart'; // import the product model

class ProductGrid extends StatelessWidget {
  final List<Product> products; // list of products to display
  const ProductGrid({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          // configure the grid layout
          maxCrossAxisExtent:
              200, // maximum cross-axis extent (width or height depending on scroll direction)
          childAspectRatio: 2 / 3, // aspect ratio of each grid item
          crossAxisSpacing:
              10, // spacing between grid items along the cross-axis
          mainAxisSpacing: 10 // spacing between grid items along the main axis
          ),
      physics:
          const BouncingScrollPhysics(), // add a bouncy scroll physics effect
      padding: const EdgeInsets.all(10), // add padding to the grid view
      itemCount:
          products.length, // specify the number of items to display in the grid
      itemBuilder: (context, index) => ProductCard(
          product: products[
              index]), // build each grid item using the product card component
    );
  }
}
