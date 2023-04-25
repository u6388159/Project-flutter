import 'package:cached_network_image/cached_network_image.dart'; // Importing the CachedNetworkImage package to load images from the network and cache them
import 'package:flutter/material.dart'; // Importing the Flutter Material package which contains the widgets for Material Design
import 'package:my_grocery/const.dart'; // Importing the constants used in the app
import 'package:shimmer/shimmer.dart'; // Importing the Shimmer package which contains a widget to create shimmering effect

import '../../../model/product.dart'; // Importing the Product model
import '../../product_details/product_details_screen.dart'; // Importing the product details screen

class ProductCard extends StatelessWidget {
  // A stateless widget which displays a product card
  final Product product; // A required product object to be displayed
  const ProductCard({Key? key, required this.product})
      : super(key: key); // Constructor for ProductCard

  @override
  Widget build(BuildContext context) {
    // Build method which returns the widget tree
    return InkWell(
      // InkWell widget which creates a clickable area with an ink splash
      onTap: () {
        // When the product card is tapped
        FocusScope.of(context)
            .requestFocus(FocusNode()); // Remove the focus from the input field
        Navigator.push(
            // Navigate to the product details screen
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                    product:
                        product // Pass the product object to the product details screen
                    )));
      },
      child: Material(
        // Material widget which implements Material Design styling
        elevation: 8, // The elevation of the product card
        shadowColor:
            Colors.grey.shade300, // The shadow color of the product card
        color: Colors.white, // The background color of the product card
        borderRadius:
            BorderRadius.circular(10), // The border radius of the product card
        child: Padding(
          // A Padding widget which adds padding to the content of the product card
          padding: const EdgeInsets.all(12),
          child: Column(
            // A Column widget which displays the content of the product card
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                // A Flexible widget which makes the hero image take up most of the available space
                flex: 5,
                child: Center(
                  // A Center widget which centers the hero image vertically and horizontally
                  child: Hero(
                    // A Hero widget which creates a hero animation for the product image
                    tag: product
                        .images.first, // The hero tag for the product image
                    child: CachedNetworkImage(
                      // A CachedNetworkImage widget which loads the product image from the network and cache it
                      imageUrl: baseUrl +
                          product.images.first, // The URL for the product image
                      placeholder: (context, url) => Shimmer.fromColors(
                        // A Shimmer widget which creates a shimmering effect as a placeholder for the product image
                        highlightColor: Colors.white,
                        baseColor: Colors.grey.shade300,
                        child: Container(
                          // A Container widget which holds the shimmer widget
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        // A widget which is displayed when an error occurs while loading the product image
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$${product.tags.first.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
