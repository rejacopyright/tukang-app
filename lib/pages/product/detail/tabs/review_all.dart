import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:woless/_widgets/user_card.dart';
import 'package:woless/pages/product/detail/tabs/review.dart';

class ShowAllReviewController extends GetxController {
  RxBool loadingPage = false.obs;
  setRefreshPage() {
    loadingPage.value = false;
    Future.delayed(const Duration(milliseconds: 200), () {
      loadingPage.value = true;
    });
  }

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 200), () {
      loadingPage.value = true;
    });
    super.onReady();
  }
}

class ShowAllReview extends StatefulWidget {
  const ShowAllReview({
    super.key,
    required this.imgList,
  });

  final List<String> imgList;

  @override
  State<ShowAllReview> createState() => _ShowAllReviewState();
}

class _ShowAllReviewState extends State<ShowAllReview> {
  final showAllReviewController = Get.put(ShowAllReviewController());

  @override
  void initState() {
    showAllReviewController.setRefreshPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<({double value, String label, Color color})> rates = [
      (value: 0.95, label: 'Sangat Puas', color: Colors.green.shade600),
      (value: 0.75, label: 'Puas', color: Colors.green.shade300),
      (value: 0.5, label: 'Biasa Saja', color: Colors.yellow.shade600),
      (value: 0.25, label: 'Tidak Puas', color: Colors.amber.shade600),
      (value: 0.1, label: 'Kecewa', color: Colors.red),
    ];
    return Obx(() {
      final pageIsReady = showAllReviewController.loadingPage.value;
      if (!pageIsReady) {
        return const ReviewAllLoader();
      }
      return ListView(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  '4.5',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RatingBarIndicator(
                rating: 4.5,
                unratedColor: const Color(0xffdddddd),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 16,
                direction: Axis.horizontal,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10, top: 2.5),
                child: Text(
                  'Dari 359 ulasan',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ...rates.map(
                (e) => Container(
                  alignment: Alignment.center,
                  width: Get.width / 1.25,
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width / 3.5,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            e.label,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: e.value,
                          color: e.color,
                          backgroundColor: Colors.black.withOpacity(0.15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
            ],
          ),
          ...widget.imgList.map((e) => UserReview(avatar: e)),
        ],
      );
    });
  }
}

class ReviewAllLoader extends StatelessWidget {
  const ReviewAllLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(bottom: 15, top: 10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 10,
          width: 50,
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 10,
          width: 100,
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 20)),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => const PageLoader(),
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
