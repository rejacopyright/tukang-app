import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_widgets/viewer.dart';
import 'package:woless/pages/product/detail/main.dart';

class ProductDetailImageSliderController extends ProductDetailController {
  RxInt currentIndex = 0.obs;
  setCurrenIndex(val) {
    currentIndex.value = val;
  }
}

final CarouselController _controller = CarouselController();

class ProductDetailImageSlider extends StatelessWidget {
  ProductDetailImageSlider({
    super.key,
  });

  final store = Get.put(ProductDetailImageSliderController());

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/sample/art-1.jpg',
      'assets/images/sample/art-2.jpg',
      'assets/images/sample/prewed.jpg',
    ];
    return Obx(() {
      final pageIsReady = store.loadingPage.value;
      if (pageIsReady) {
        return Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      store.setCurrenIndex(index);
                    },
                  ),
                  items: imgList.map((item) {
                    return InkWell(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (_) => ImageViewer(
                              image: item,
                            ),
                          );
                        },
                        child: Ink.image(
                          image: AssetImage(
                            item,
                          ),
                          fit: BoxFit.cover,
                        ));
                  }).toList(),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 50),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3.5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      '${(store.currentIndex.value + 1).toString()} / ${imgList.length}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              constraints: const BoxConstraints(maxHeight: 50),
              child: ListView(
                shrinkWrap: false,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                scrollDirection: Axis.horizontal,
                children: imgList.asMap().entries.map((e) {
                  final activeIndex = e.key == store.currentIndex.value;
                  return InkWell(
                    onTap: () {
                      _controller.animateToPage(
                        e.key,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                      store.setCurrenIndex(e.key);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          width: 2,
                          color: activeIndex
                              ? Theme.of(context).primaryColor.withOpacity(0.5)
                              : Colors.transparent,
                        ),
                      ),
                      width: 50,
                      child: Image.asset(
                        e.value,
                        fit: BoxFit.cover,
                        opacity: AlwaysStoppedAnimation(activeIndex ? 1 : 0.5),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        );
      }
      return Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.05)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            child: Row(
              children: List.generate(
                3,
                (index) => Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
