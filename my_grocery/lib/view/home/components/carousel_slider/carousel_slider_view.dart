import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/model/ad_banner.dart';
import 'package:my_grocery/view/home/components/carousel_slider/banner_card.dart';

class CarouselSliderView extends StatefulWidget {
  final List<AdBanner> bannerList;
  const CarouselSliderView({Key? key, required this.bannerList})
      : super(key: key);

  @override
  State<CarouselSliderView> createState() => _CarouselSliderViewState();
}

class _CarouselSliderViewState extends State<CarouselSliderView> {
  int _currentIndex = 0;
  late List<Widget> _bannerList;

  @override
  void initState() {
    // create a list of BannerCard widgets from the bannerList
    _bannerList =
        widget.bannerList.map((e) => BannerCard(imageUrl: e.image)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // create a CarouselSlider widget using the BannerCard list as the items
        CarouselSlider(
            items: _bannerList,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                })),
        // create a row of indicators for each banner in the list
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.bannerList.map((e) {
            // get the index of the current banner in the list
            int index = widget.bannerList.indexOf(e);
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? const Color.fromRGBO(0, 0, 0, 0.9)
                      : const Color.fromRGBO(0, 0, 0, 0.4)),
            );
          }).toList(),
        )
      ],
    );
  }
}
