import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.label, this.icon});

  final String label;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).primaryColor;
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () {
        Get.toNamed('profile');
      },
      // child: Stack(
      //   clipBehavior: Clip.none,
      //   alignment: AlignmentDirectional.center,
      //   fit: StackFit.loose,
      //   children: [
      //     Container(
      //       width: 40,
      //       padding: const EdgeInsets.all(5),
      //       margin: const EdgeInsets.symmetric(vertical: 10),
      //       decoration: BoxDecoration(
      //           color: primary.withOpacity(0.035),
      //           borderRadius: BorderRadius.circular(12.5),
      //           border: Border.all(color: primary.withOpacity(0.175))),
      //       child: Image.asset(icon ?? 'logo.png'),
      //     ),
      //     Positioned(
      //         width: MediaQuery.of(context).size.width / 6,
      //         top: 50,
      //         child: Text(
      //           label,
      //           textAlign: TextAlign.center,
      //           style: const TextStyle(fontSize: 10),
      //         )),
      //   ],
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 42.5,
            padding: const EdgeInsets.all(7.5),
            margin: const EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
                color: primary.withOpacity(0.025),
                borderRadius: BorderRadius.circular(12.5),
                border: Border.all(color: primary.withOpacity(0.175))),
            child: Image.asset(icon ?? 'logo.png'),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 1.5),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10.5),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
