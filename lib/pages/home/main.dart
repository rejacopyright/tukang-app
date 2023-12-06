import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_widgets/title_show_all.dart';
import 'package:woless/pages/home/banner_promo.dart';
import 'package:woless/pages/home/header.dart';
import 'package:woless/pages/home/service_card.dart';
import 'package:woless/pages/home/top_user_card.dart';

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

List<Widget> content = [
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
];

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
              flexibleSpace: HomeHeader(pageIsReady: pageIsReady),
            );
          }),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(children: content);
              },
              childCount: 1,
            ),
          ),
        ],
      );
    });
  }
}
