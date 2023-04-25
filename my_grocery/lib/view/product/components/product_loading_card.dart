import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductLoadingCard extends StatelessWidget {
  const ProductLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // A Material widget with some elevation and border radius
    return Material(
      elevation: 8,
      shadowColor: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        // A shimmer effect widget that simulates loading state
        child: Shimmer.fromColors(
          highlightColor: Colors.white, // The color of shimmer highlight
          baseColor: Colors.grey.shade300, // The color of shimmer base
          child: Column(
            children: [
              // The top part of the card, showing a placeholder image
              Flexible(
                flex: 5,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              // The bottom part of the card, showing some text placeholders
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    // A placeholder for product name
                    Container(
                      height: 20,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 5),
                    // A placeholder for product price
                    Container(
                      height: 15,
                      width: 75,
                      color: Colors.grey.shade300,
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
