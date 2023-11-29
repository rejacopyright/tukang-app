import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('PROFILEs'),
      // Icon(Iconsax.profile_circle5)
    ])));
  }
}
