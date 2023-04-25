import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/const.dart'; // Importing constants like `baseUrl`.
import 'package:shimmer/shimmer.dart';

class BannerCard extends StatelessWidget {
  final String imageUrl;

  const BannerCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: CachedNetworkImage(
          imageUrl:
              '$baseUrl$imageUrl', // Using the constant baseUrl to construct the image URL.
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey.shade300,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          fit: BoxFit
              .cover, // Setting the image fit to cover the entire container.
          width: double
              .infinity, // Setting the image width to the container width.
        ),
      ),
    );
  }
}
