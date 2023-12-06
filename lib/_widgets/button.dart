import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class LinkWell extends StatelessWidget {
  const LinkWell({super.key, required this.to, required this.child});
  final String to;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () {
        Future.delayed(const Duration(milliseconds: 200), () {
          Get.rootDelegate.toNamed(to);
        });
      },
      child: child,
    );
  }
}
