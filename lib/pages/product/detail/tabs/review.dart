import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_widgets/user_card.dart';
import 'package:woless/pages/product/detail/tabs/review_all.dart';

class ProductDetailTabReviewController extends GetxController {
  RxBool loadingPage = false.obs;

  setLoadingpage(payload) {
    loadingPage.value = payload;
    Future.delayed(const Duration(milliseconds: 100), () => onReady());
  }

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 100), () {
      loadingPage.value = true;
    });
    super.onReady();
  }
}

class ProductDetailTabReview extends StatefulWidget {
  const ProductDetailTabReview({super.key});

  @override
  State<ProductDetailTabReview> createState() => _ProductDetailTabReviewState();
}

class _ProductDetailTabReviewState extends State<ProductDetailTabReview> {
  final store = Get.put(ProductDetailTabReviewController());

  @override
  void initState() {
    super.initState();
    store.setLoadingpage(false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/avatar/1.png',
      'assets/avatar/5.png',
      'assets/avatar/3.png',
      'assets/avatar/4.png',
      'assets/avatar/6.png',
      'assets/avatar/2.png',
    ];
    return Obx(() {
      final pageIsReady = store.loadingPage.value;
      if (pageIsReady) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...imgList.map((e) => UserReview(avatar: e)),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      useSafeArea: true,
                      isScrollControlled: true,
                      constraints: BoxConstraints(
                        minHeight: 100,
                        maxHeight: Get.height - 100,
                      ),
                      context: context,
                      builder: (context) {
                        return Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          clipBehavior: Clip.antiAlias,
                          child: Ink(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 7.5,
                                  width: 75,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: ShowAllReview(imgList: imgList),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }
      return Column(children: List.generate(5, (index) => const PageLoader()));
    });
  }
}

class PageLoader extends StatelessWidget {
  const PageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 10,
                    width: Get.width / 2,
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                  ),
                  Container(
                    height: 10,
                    width: Get.width / 3,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 50,
            width: Get.width,
            margin: const EdgeInsets.symmetric(vertical: 7.5),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(7.5),
            ),
          ),
        ],
      ),
    );
  }
}
