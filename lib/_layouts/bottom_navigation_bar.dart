import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_routes/main.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key, this.name});
  final String? name;
  // final data = Get.put(BottomNavStore());

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black,
      elevation: 7.5,
      child: SizedBox(
        height: 50,
        child: Row(
            children: menusNav
                .map((menu) => Expanded(
                    child: InkWell(
                        splashFactory: NoSplash.splashFactory,
                        // hoverDuration: const Duration(milliseconds: 0),
                        // enableFeedback: false,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 1), () {
                            Get.rootDelegate.toNamed(menu.name);
                          });
                        },
                        // onTapDown: (e) {
                        //   data.setActivePage(menu.name);
                        // },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                name == menu.name ? menu.activeIcon : menu.icon,
                                color: name == menu.name
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                                size: 20.0),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.5)),
                            Text(menu.label ?? '',
                                style: TextStyle(
                                    fontSize: 11.0,
                                    color: name == menu.name
                                        ? Theme.of(context).primaryColor
                                        : Colors.black)),
                          ],
                        ))))
                .toList()),
      ),
    );
  }
}
