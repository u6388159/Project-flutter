import 'package:flutter/material.dart';
import 'package:my_grocery/view/home/components/popular_product/popular_product_card.dart';

import '../../../../model/product.dart';

class PopularProduct extends StatelessWidget {
  final List<Product> popularProducts;
  const PopularProduct({Key? key, required this.popularProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal, // scroll horizontally
          physics:
              const BouncingScrollPhysics(), // add bounce effect when scrolling
          itemCount: popularProducts
              .length, // set number of items to the length of the popularProducts list
          itemBuilder: (context, index) => PopularProductCard(
              product: popularProducts[
                  index])), // create PopularProductCard for each product in the popularProducts list
    );
  }
}
