import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_routes/main.dart';
import 'package:woless/_widgets/button.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key, this.name});
  final String? name;
  // final data = Get.put(BottomNavStore());

  @override
  Widget build(BuildContext context) {
    final List<String> childrenOfApp = menusNav
        .firstWhereOrNull((e) => e.name == '/app')!
        .children!
        .map((e) => e.name)
        .toList();
    return Material(
      shadowColor: Colors.black,
      elevation: 7.5,
      child: SizedBox(
        height: 50,
        child: Row(
          children: menusNav.map(
            (menu) {
              final isChildrenOfApp =
                  menu.name == '/app' && childrenOfApp.contains(name);
              final isCurrentRoute =
                  name.toString().startsWith(menu.name) || isChildrenOfApp;
              return Expanded(
                child: LinkWell(
                  to: '/app/${menu.name}',
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
      ),
    );
  }
}
