import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:woless/pages/product/detail/main.dart';

class ProductDetailDescriptionController extends ProductDetailController {}

class ProductDetailDescription extends StatelessWidget {
  ProductDetailDescription({super.key});

  final store = Get.put(ProductDetailDescriptionController());

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    return Obx(() {
      final pageIsReady = store.loadingPage.value;
      if (pageIsReady) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 5,
                    children: [
                      RatingBarIndicator(
                        rating: 4,
                        unratedColor: const Color(0xffdddddd),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 16,
                        direction: Axis.horizontal,
                      ),
                      Text(
                        '(350)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const Wrap(
                  spacing: 2,
                  children: [
                    Icon(Icons.check_circle, size: 14, color: Colors.green),
                    Text(
                      '2.9K',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 7.5,
                vertical: 5,
              ),
              margin: const EdgeInsets.only(top: 15, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.15),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Asisten Rumah Tangga',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
            const Text(
              'Jasa Asisten Rumah Tangga - Multi Talent - Dapat mengerjakan pekerjaan rumah',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        );
      }
      return Column(
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
      );
    });
  }
}
