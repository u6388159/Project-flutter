import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/component/main_header.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/view/product/components/product_grid.dart';
import 'package:my_grocery/view/product/components/product_loading_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Add the main header widget
          const MainHeader(),
          Expanded(
            child: Obx(() {
              // Check if the products are still loading, and show a loading grid
              // if so
              if (productController.isProductLoading.value) {
                return const ProductLoadingGrid();
              } else {
                // If the products have finished loading, show them in a grid
                if (productController.productList.isNotEmpty) {
                  return ProductGrid(products: productController.productList);
                } else {
                  // If there are no products to show, display a message and an
                  // image indicating that no products were found
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/product_not_found.png'),
                      const SizedBox(height: 10),
                      const Text('Products Not Found!')
                    ],
                  );
                }
              }
            }),
          ),
        ],
      ),
    );
  }
}
