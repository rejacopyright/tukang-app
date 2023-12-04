import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class BannerPromo extends StatelessWidget {
  BannerPromo({super.key});
  var currentPage = 0.obs;

  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'assets/images/home-banner-1.jpg',
    'assets/images/home-banner-2.jpg',
    'assets/images/home-banner-3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Stack(children: [
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: 100.0,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeFactor: 0.15,
              onPageChanged: (index, reason) {
                currentPage.value = index;
              },
            ),
            items: imgList.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: const EdgeInsets.symmetric(horizontal: 0.0),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(31, 125, 125, 125),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: Image.asset(item,
                              fit: BoxFit.cover, width: double.infinity)
                          // child: Image.network(item,
                          //     fit: BoxFit.cover, width: 1000)
                          ));
                },
              );
            }).toList(),
          ),
          Obx(() => Container(
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              child: AnimatedSmoothIndicator(
                  // controller: controller,
                  activeIndex: currentPage.value,
                  count: imgList.length,
                  effect: WormEffect(
                    dotHeight: 5,
                    dotWidth: 5,
                    spacing: 3,
                    strokeWidth: 0,
                    dotColor: const Color.fromARGB(150, 255, 255, 255),
                    activeDotColor: Theme.of(context).primaryColor,
                    // type: WormType.thin,
                  )))),
        ]));
  }
}
