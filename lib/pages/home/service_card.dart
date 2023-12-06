import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_config/services.dart';

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
        Get.rootDelegate.toNamed('/app/profile');
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

class ServiceSectionController extends GetxController {
  RxBool loadingPage = false.obs;

  @override
  void onReady() {
    loadingPage.value = true;
    super.onReady();
  }
}

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Get.put(ServiceSectionController());
    return Obx(() {
      final pageIsReady = store.loadingPage.value;
      if (pageIsReady) {
        return GridView.count(
          restorationId: 'home_menu',
          crossAxisCount: 6,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          physics: const NeverScrollableScrollPhysics(),
          // childAspectRatio: 0.9,
          shrinkWrap: true,
          // controller:
          //     ScrollController(keepScrollOffset: false),
          scrollDirection: Axis.vertical,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          children: servicesList
              .where((item) => item.home == true)
              .map((e) => ServiceCard(label: e.label, icon: e.icon))
              .toList(),
        );
      }
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: List.generate(
            4,
            (index) => Container(
              width: (MediaQuery.of(context).size.width / 4) - 15,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
          ),
        ),
      );
    });
  }
}
