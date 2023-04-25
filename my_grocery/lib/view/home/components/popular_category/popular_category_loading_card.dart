import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularCategoryLoadingCard extends StatelessWidget {
  const PopularCategoryLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10), // padding for the card
      child: Material(
        elevation: 8, // elevation for the card
        shadowColor: Colors.grey.shade300, // shadow color for the card
        borderRadius: BorderRadius.circular(10), // border radius for the card
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300, // base color for the shimmer effect
          highlightColor:
              Colors.white, // highlight color for the shimmer effect
          child: Container(
            width: 270, // width of the card
            height: 140, // height of the card
            decoration: BoxDecoration(
                color:
                    Colors.grey.shade300, // background color for the container
                borderRadius:
                    BorderRadius.circular(10) // border radius for the container
                ),
          ),
        ),
      ),
    );
  }
}
