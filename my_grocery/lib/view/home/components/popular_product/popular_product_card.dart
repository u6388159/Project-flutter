import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/const.dart'; // import constants
import 'package:shimmer/shimmer.dart'; // import shimmer package

import '../../../../model/product.dart'; // import product model

class PopularProductCard extends StatelessWidget {
  final Product product; // create final variable product of type Product
  const PopularProductCard({Key? key, required this.product})
      : super(
            key:
                key); // constructor for PopularProductCard that takes a required Product

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10), // set padding
      child: Material(
        elevation: 8, // set elevation
        shadowColor: Colors.grey.shade300, // set shadow color
        borderRadius: BorderRadius.circular(10), // set border radius
        child: Container(
          margin: const EdgeInsets.all(10), // set container margin
          width: 120, // set container width
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.9, // set aspect ratio for image
                child: CachedNetworkImage(
                  imageUrl: baseUrl + product.images.first, // set image url
                  placeholder: (context, url) => Shimmer.fromColors(
                    highlightColor:
                        Colors.white, // set highlight color for shimmer
                    baseColor:
                        Colors.grey.shade300, // set base color for shimmer
                    child: Container(
                      color: Colors.grey, // set color for container
                      padding:
                          const EdgeInsets.all(15), // set padding for container
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25 // set horizontal margin for container
                          ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error_outline, // set icon for error
                      color: Colors.grey, // set color for icon
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10), // set sized box height
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Text(
                  product.name, // set product name
                  style: const TextStyle(
                      color: Colors.black, // set text color
                      fontSize: 14 // set font size
                      ),
                  maxLines: 1, // set max lines for text
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
