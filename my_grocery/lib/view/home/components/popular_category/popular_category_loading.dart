import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'popular_category_loading_card.dart';

class PopularCategoryLoading extends StatelessWidget {
  const PopularCategoryLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Container to hold the ListView
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      // ListView to display the loading cards
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          // itemBuilder to build the individual loading cards
          itemBuilder: (context, index) => const PopularCategoryLoadingCard()),
    );
  }
}
