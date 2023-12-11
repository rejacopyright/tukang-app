import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_controller/bottom_navgation_bar_controller.dart';
import 'package:woless/_routes/main.dart';
import 'package:woless/_widgets/button.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({super.key, this.name});
  final String? name;
  final navController = Get.put(BottomNavStore());

  @override
  Widget build(BuildContext context) {
    final List<String> childrenOfApp = menusNav
        .firstWhereOrNull((e) => e.name == homeRoute)!
        .children!
        .map((e) => e.name)
        .toList();
    return Material(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 7.5,
      child: Obx(
        () {
          if (navController.nav.value) {
            return SizedBox(
              height: 50,
              child: Row(
                children: menusNav.map(
                  (menu) {
                    final isChildrenOfApp = homeRoute != '/' &&
                        menu.name == homeRoute &&
                        childrenOfApp.contains(name);
                    final isMain = name == '/' && menu.name == homeRoute;
                    final isCurrentRoute =
                        name.toString().startsWith(menu.name) ||
                            isChildrenOfApp ||
                            isMain;
                    return Expanded(
                      child: LinkWell(
                        to: menu.name,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(isCurrentRoute ? menu.activeIcon : menu.icon,
                                color: isCurrentRoute
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                                size: 20.0),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.5)),
                            Text(
                              menu.label ?? '',
                              style: TextStyle(
                                  fontSize: 11.0,
                                  color: isCurrentRoute
                                      ? Theme.of(context).primaryColor
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
