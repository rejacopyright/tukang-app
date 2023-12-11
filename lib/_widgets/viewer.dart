import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewer extends StatelessWidget {
  ImageViewer({super.key, required this.image});
  final String image;
  final imageController = TransformationController();

  @override
  Widget build(BuildContext context) {
    // TapDownDetails? doubleTapDetails;
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          GestureDetector(
            // onDoubleTapDown: (d) => doubleTapDetails = d,
            onDoubleTap: () {
              if (imageController.value != Matrix4.identity()) {
                imageController.value = Matrix4.identity();
              } else {
                // final position = doubleTapDetails!.localPosition;
                imageController.value = Matrix4.identity()
                  // ..translate(-position.dx, -position.dy)
                  ..translate(-(MediaQuery.of(context).size.width / 2),
                      -(MediaQuery.of(context).size.height / 2 - 40))
                  ..scale(2.0);
              }
            },
            child: SizedBox.expand(
              child: InteractiveViewer(
                transformationController: imageController,
                // constrained: false,
                clipBehavior: Clip.none,
                maxScale: 3,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: () => Get.rootDelegate.popRoute(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
