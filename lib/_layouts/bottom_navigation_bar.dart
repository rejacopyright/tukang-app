// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:woless/_controller/bottom_navgation_bar_controller.dart';
import 'package:woless/_routes/main.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({super.key});
  final data = Get.put(BottomNavStore());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Row(
          children: menus
              .map((menu) => Expanded(
                  child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      hoverDuration: const Duration(milliseconds: 0),
                      enableFeedback: false,
                      onTap: () {
                        context.goNamed(menu.name);
                      },
                      onTapDown: (e) {
                        data.setActivePage(menu.name);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              data.activePage.toString() == menu.name
                                  ? menu.activeIcon
                                  : menu.icon,
                              color: data.activePage.toString() == menu.name
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                              size: 20.0),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.5)),
                          Text(menu.label ?? '',
                              style: TextStyle(
                                  fontSize: 11.0,
                                  color: data.activePage.toString() == menu.name
                                      ? Theme.of(context).primaryColor
                                      : Colors.black)),
                        ],
                      ))))
              .toList()),
    );
  }
}
