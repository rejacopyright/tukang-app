import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
                strokeWidth: 2,
              ),
            ),
            const Text('PROFILEs'),
            ElevatedButton(
                onPressed: () {
                  Get.reload();
                  // log('${Get.rootDelegate.history.last}');
                },
                child: const Text('Refresh')),
            // Icon(Iconsax.profile_circle5)
          ],
        ),
      ),
    );
  }
}
