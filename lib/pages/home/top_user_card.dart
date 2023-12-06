import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_widgets/user_card.dart';

class TopUserCardController extends GetxController {
  RxBool loadingPage = false.obs;

  @override
  void onReady() {
    loadingPage.value = true;
    super.onReady();
  }
}

class TopUserCard extends StatelessWidget {
  TopUserCard({super.key});

  final List<String> imgList = [
    'assets/avatar/1.png',
    'assets/avatar/5.png',
    'assets/avatar/3.png',
    'assets/avatar/4.png',
    'assets/avatar/6.png',
  ];

  @override
  Widget build(BuildContext context) {
    final store = Get.put(TopUserCardController());
    return Obx(() {
      final pageIsReady = store.loadingPage.value;
      if (pageIsReady) {
        return Container(
          constraints: const BoxConstraints(maxHeight: 145),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            children: imgList
                .map(
                  (e) => Container(
                    width: (MediaQuery.of(context).size.width / 3) - 15,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black.withOpacity(0.5),
                      elevation: 3.5,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10),
                      //   color: Colors.white,
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Colors.black.withOpacity(0.15),
                      //       offset: const Offset(1, 1),
                      //       blurRadius: 10,
                      //       spreadRadius: -5,
                      //     )
                      //   ],
                      // ),
                      child: InkWell(
                          // splashFactory: NoSplash.splashFactory,
                          splashFactory: InkSplash.splashFactory,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Future.delayed(const Duration(milliseconds: 200),
                                () {
                              Get.rootDelegate.toNamed('/app/coba');
                            });
                          },
                          child: StackedUserCard(avatar: e)),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: List.generate(
            3,
            (index) => Container(
              width: (MediaQuery.of(context).size.width / 3) - 17.5,
              height: 125,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
          ),
        ),
      );
    });
  }
}
