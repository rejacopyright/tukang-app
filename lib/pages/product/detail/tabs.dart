import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/pages/product/detail/main.dart';
import 'package:woless/pages/product/detail/tabs/description.dart';
import 'package:woless/pages/product/detail/tabs/review.dart';

class TabList {
  String id;
  String label;
  Widget child;
  TabList({
    required this.id,
    required this.label,
    required this.child,
  });
}

class ProductDetailTabsController extends ProductDetailController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  final List<TabList> tabs = [
    TabList(
      id: 'description',
      label: 'Deskripsi',
      child: const ProductDetailTabDescription(),
    ),
    TabList(
      id: 'review',
      label: 'Ulasan',
      child: const ProductDetailTabReview(),
    ),
  ];

  RxString currentID = ''.obs;
  setID(val) => currentID.value = val;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: tabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

class ProductDetailTabs extends StatelessWidget {
  const ProductDetailTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Get.put(ProductDetailTabsController());
    return Obx(() {
      final pageIsReady = store.loadingPage.value;
      if (pageIsReady) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              physics: const ClampingScrollPhysics(),
              tabAlignment: TabAlignment.start,
              splashFactory: NoSplash.splashFactory,
              dividerColor: Colors.white,
              unselectedLabelColor: Colors.black.withOpacity(0.5),
              labelColor: Colors.black,
              indicatorColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              isScrollable: true,
              controller: store.controller,
              onTap: (e) {
                store.setID(store.tabs[e].id);
                Future.delayed(const Duration(milliseconds: 100), () {
                  // Scrollable.ensureVisible(context);
                  RenderBox thisBox = productDetailTabKey.currentContext!
                      .findRenderObject() as RenderBox;
                  Offset position = thisBox.localToGlobal(Offset.zero);
                  if (position.dy > MediaQuery.of(context).size.height / 2) {
                    productDetailScrollController.animateTo(
                      position.dy - kToolbarHeight - 20,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.linear,
                    );
                  }
                  // productDetailScrollController.jumpTo(position.dy);
                });
              },
              tabs: store.tabs.map((e) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Text(
                    e.label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: List.generate(
            2,
            (index) => Expanded(
              child: Container(
                height: 20,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class ProductDetailTabContent extends StatelessWidget {
  const ProductDetailTabContent({super.key});

  // final Widget child;

  @override
  Widget build(BuildContext context) {
    final store = Get.find<ProductDetailTabsController>();
    final fullWidth = MediaQuery.of(context).size.width;
    return Obx(() {
      final pageIsReady = store.loadingPage.value;
      late Widget currentTabContent = store.tabs
              .where((e) => e.id == store.currentID.value)
              .map((e) => e.child)
              .firstOrNull ??
          store.tabs.first.child;
      if (pageIsReady) {
        return Container(
          padding: const EdgeInsets.all(10),
          // color: Colors.white,
          child: currentTabContent,
        );
      }
      return Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 15,
              width: fullWidth / 2,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
            Container(
              height: 15,
              width: fullWidth / 3,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
            Container(
              height: 50,
              width: fullWidth,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
          ],
        ),
      );
    });
  }
}
