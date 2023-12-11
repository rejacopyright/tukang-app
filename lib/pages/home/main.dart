import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_widgets/title_show_all.dart';
import 'package:woless/pages/home/banner_promo.dart';
import 'package:woless/pages/home/header.dart';
import 'package:woless/pages/home/post_card.dart';
import 'package:woless/pages/home/service_card.dart';
import 'package:woless/pages/home/top_user_card.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Homepage();
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

  @override
  void refresh() {
    loadingPage.value = false;
    Future.delayed(const Duration(milliseconds: 400), () {
      onReady();
    });
    super.refresh();
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomepageController());
    final topUserController = Get.put(TopUserCardController());
    final serviceController = Get.put(ServiceSectionController());
    final bannerController = Get.put(BannerPromoController());
    final postController = Get.put(PostSectionController());
    return Obx(() {
      final pageIsReady = homeController.loadingPage.value;
      return NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [HomeHeader(pageIsReady: pageIsReady)];
        },
        body: RefreshIndicator(
          color: Theme.of(context).primaryColor,
          displacement: 30,
          onRefresh: () async {
            bannerController.refresh();
            serviceController.refresh();
            topUserController.refresh();
            postController.refresh();
          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              overscroll: false,
            ),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(children: content);
                  },
                  childCount: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const PostSection(),
                  ),
                  childCount: 1,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
