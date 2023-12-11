import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_controller/bottom_navgation_bar_controller.dart';
import 'package:woless/pages/product/detail/description.dart';
import 'package:woless/pages/product/detail/image_slider.dart';
import 'package:woless/pages/product/detail/price.dart';
import 'package:woless/pages/product/detail/tabs.dart';
import 'package:woless/pages/product/topbar.dart';

class ProductDetailController extends GetxController {
  final navController = Get.put(BottomNavStore());
  RxBool loadingPage = false.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 100), () {
      navController.showNav(false);
    });
    super.onInit();
  }

  @override
  void onReady() {
    loadingPage.value = true;
    Future.delayed(const Duration(milliseconds: 100), () {
      navController.showNav(false);
    });
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

  @override
  InternalFinalCallback<void> get onDelete {
    Future.delayed(const Duration(milliseconds: 100), () {
      navController.showNav(true);
    });
    return super.onDelete;
  }
}

ScrollController productDetailScrollController = ScrollController();
GlobalKey productDetailTabKey = GlobalKey();

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailController());
    final productDetailPriceController =
        Get.put(ProductDetailPriceController());
    final productDetailImageSliderController =
        Get.put(ProductDetailImageSliderController());
    final productDetailDescriptionController =
        Get.put(ProductDetailDescriptionController());
    final productDetailTabsController = Get.put(ProductDetailTabsController());
    return NestedScrollView(
      floatHeaderSlivers: false,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [const ProductDetailTopBar()];
      },
      body: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        displacement: 30,
        onRefresh: () async {
          productDetailImageSliderController.refresh();
          productDetailPriceController.refresh();
          productDetailDescriptionController.refresh();
          productDetailTabsController.refresh();
        },
        child: CustomScrollView(
          controller: productDetailScrollController,
          physics: const ClampingScrollPhysics(),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            overscroll: false,
          ),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: [
                    ProductDetailImageSlider(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ProductDetailPrice(),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: ProductDetailDescription(),
                    ),
                  ],
                );
              }, childCount: 1),
            ),
            SliverAppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.black.withOpacity(0.25),
              elevation: 1,
              pinned: true,
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.transparent,
              centerTitle: false,
              toolbarHeight: 20,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                title: ProductDetailTabs(
                  key: productDetailTabKey,
                ),
              ),
            ),
            SliverList.builder(
              itemBuilder: (context, index) {
                return const ProductDetailTabContent();
              },
              itemCount: 1,
            ),
          ],
        ),
      ),
    );
  }
}
