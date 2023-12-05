import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_config/services.dart';
import 'package:woless/_widgets/title_show_all.dart';
import 'package:woless/pages/home/banner_promo.dart';
import 'package:woless/pages/home/service_card.dart';
import 'package:woless/pages/home/top_user_card.dart';

// class HomeController extends GetxController {
//   RxBool loadingPage = false.obs;

//   @override
//   void onReady() {
//     log('home is ready');
//     loadingPage.value = true;
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     log('dispose');
//     super.onClose();
//   }
// }

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final store = Get.put(HomeController());
    const double expandedHeight = 150.0;
    const double toolbarHeight = 0.0;
    return const Homepage(
        expandedHeight: expandedHeight, toolbarHeight: toolbarHeight);
  }
}

class HomepageController extends GetxController {
  RxBool loadingPage = false.obs;

  @override
  void onReady() {
    loadingPage.value = true;
    super.onReady();
  }
}

class Homepage extends StatelessWidget {
  const Homepage({
    super.key,
    required this.expandedHeight,
    required this.toolbarHeight,
  });

  final double expandedHeight;
  final double toolbarHeight;

  @override
  Widget build(BuildContext context) {
    final store = Get.put(HomepageController());
    return Obx(() {
      final pageIsReady = store.loadingPage.value;
      return CustomScrollView(
        // physics: const BouncingScrollPhysics(),
        slivers: [
          SliverLayoutBuilder(
              builder: (BuildContext context, sliverConstraints) {
            // final bool isCollapsed =
            //     sliverConstraints.scrollOffset + toolbarHeight >
            //         expandedHeight;
            // final Brightness statusBarColor =
            //     isCollapsed ? Brightness.dark : Brightness.light;
            return SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              stretch: false,
              expandedHeight: expandedHeight,
              collapsedHeight: toolbarHeight,
              toolbarHeight: toolbarHeight,
              surfaceTintColor: Colors.transparent,
              centerTitle: false,
              // systemOverlayStyle: SystemUiOverlayStyle(
              //   statusBarColor:
              //       isCollapsed ? Colors.white : Colors.transparent,
              //   systemStatusBarContrastEnforced: true,
              //   statusBarIconBrightness: statusBarColor, // Android
              //   statusBarBrightness: statusBarColor, // IOS
              // ),
              flexibleSpace: FlexibleSpaceBar(
                // titlePadding: const EdgeInsets.all(0.0),
                // title: const AnimatedOpacity(
                //     duration: Duration(milliseconds: 300),
                //     opacity: 1.0,
                //     child: Text(
                //       'Home',
                //       style: TextStyle(fontSize: 12.0, color: Colors.black),
                //     )),
                background: pageIsReady
                    ? Image.asset(
                        'assets/images/header-1.jpg',
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Wrap(
                          spacing: 5,
                          children: List.generate(
                            3,
                            (index) => Container(
                              margin: const EdgeInsets.only(top: 35),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            );
          }),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                    // mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: BannerPromo(),
                      ),
                      const TitleShowAll(title: 'Temukan Tukang'),
                      const ServiceSection(),
                      const TitleShowAll(
                        title: 'Tukang Unggulan',
                        margin: EdgeInsets.only(top: 20, bottom: 5),
                      ),
                      TopUserCard(),
                      const Padding(padding: EdgeInsets.only(bottom: 5))
                    ]);
              },
              childCount: 1,
            ),
          ),
        ],
      );
    });
  }
}

class ServiceSectionController extends GetxController {
  RxBool loadingPage = false.obs;

  @override
  void onReady() {
    loadingPage.value = true;
    super.onReady();
  }
}

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Get.put(ServiceSectionController());
    return Obx(() {
      final pageIsReady = store.loadingPage.value;
      if (pageIsReady) {
        return GridView.count(
          restorationId: 'home_menu',
          crossAxisCount: 6,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          physics: const NeverScrollableScrollPhysics(),
          // childAspectRatio: 0.9,
          shrinkWrap: true,
          // controller:
          //     ScrollController(keepScrollOffset: false),
          scrollDirection: Axis.vertical,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          children: servicesList
              .where((item) => item.home == true)
              .map((e) => ServiceCard(label: e.label, icon: e.icon))
              .toList(),
          // children: List.generate(
          //     3,
          //     (index) => CardHome(
          //         description: 'Lorem ipsums ${index + 1}')),
        );
      }
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: List.generate(
            4,
            (index) => Container(
              width: (MediaQuery.of(context).size.width / 4) - 15,
              height: 50,
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
