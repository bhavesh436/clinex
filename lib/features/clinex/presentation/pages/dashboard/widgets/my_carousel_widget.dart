import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinex/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controllers/carousel_controller.dart';

class MyCarouselWidget extends StatelessWidget {
  MyCarouselWidget({super.key});

  final List<String> images = [
    'assets/banners/first.jpg',
    'assets/banners/second.jpg',
    'assets/banners/third.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final carouselController = Get.put(MyCarouselController());
    return Column(
      children: [
        CarouselSlider(
          items: images.map((image) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          )).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: false,
            onPageChanged: (index, reason) {
              carouselController.currentIndex.value = index;
            },
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Obx(() => AnimatedSmoothIndicator(
          activeIndex: carouselController.currentIndex.value,
          count: images.length,
          effect: ExpandingDotsEffect(
            activeDotColor: primaryColor,
            dotColor: Colors.grey,
            dotHeight: 4,
            dotWidth: 8,
            expansionFactor: 4,
          ),
        )),
      ],
    );
  }
}



