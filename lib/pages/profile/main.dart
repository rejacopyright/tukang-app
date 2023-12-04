import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('PROFILEs'),
      ElevatedButton(
          onPressed: () {
            Get.reload();
            // log('${Get.rootDelegate.history.last}');
          },
          child: const Text('Refresh')),
      // Icon(Iconsax.profile_circle5)
    ])));
  }
}
