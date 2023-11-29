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
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
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
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 1000)));
                },
              );
            }).toList(),
          ),
          Container(
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
                  ))),
        ]));
  }
}
