import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:woless/_routes/main.dart';

class LinkWell extends StatelessWidget {
  const LinkWell({super.key, required this.to, required this.child});
  final String? to;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () {
        if (to != null && to != '') {
          Future.delayed(const Duration(milliseconds: 200), () {
            Get.rootDelegate.toNamed(
                '${homeRoute != '/' ? '$homeRoute/' : ''}${to ?? homeRoute}');
          });
        }
      },
      child: child,
    );
  }
}

class BackWell extends StatelessWidget {
  const BackWell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () {
        Future.delayed(const Duration(milliseconds: 200), () {
          Get.rootDelegate.popRoute();
        });
      },
      child: child,
    );
  }
}
