import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/pages/product/detail/main.dart';

class ProductDetailPriceController extends ProductDetailController {}

class ProductDetailPrice extends StatelessWidget {
  ProductDetailPrice({super.key});

  final store = Get.put(ProductDetailPriceController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pageIsReady = store.loadingPage.value;
      if (pageIsReady) {
        return Material(
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          shadowColor: Colors.black.withOpacity(0.5),
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black.withOpacity(0.25),
                width: 0.15,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      'Rp. 250.000',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Rp. 300.000',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.5),
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 1.5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        '17%',
                        softWrap: false,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  '1 Hari',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(7.5),
        ),
      );
    });
  }
}
