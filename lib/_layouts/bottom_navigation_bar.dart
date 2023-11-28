import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

List menus = const [
  (
    path: '/',
    label: 'Home',
    icon: Iconsax.home_2,
    activeIcon: Iconsax.home_25,
  ),
  (
    path: '/search',
    label: 'Pencarian',
    icon: Iconsax.search_normal_1,
    activeIcon: Iconsax.search_normal_1,
  ),
  (
    path: '/chat',
    label: 'Pesan',
    icon: Iconsax.message,
    activeIcon: Iconsax.message5,
  ),
  (
    path: '/cart',
    label: 'Keranjang',
    icon: Iconsax.heart5,
    activeIcon: Iconsax.heart5,
  ),
  (
    path: '/profile',
    label: 'Akun',
    icon: Iconsax.profile_circle,
    activeIcon: Iconsax.profile_circle5,
  ),
];

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  String selectedItem = '/';

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
                        context.push(menu.path);
                      },
                      onTapDown: (e) {
                        setState(() {
                          selectedItem = menu.path;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              selectedItem == menu.path
                                  ? menu.activeIcon
                                  : menu.icon,
                              color: selectedItem == menu.path
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                              size: 20.0),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.5)),
                          Text(menu.label,
                              style: TextStyle(
                                  fontSize: 11.0,
                                  color: selectedItem == menu.path
                                      ? Theme.of(context).primaryColor
                                      : Colors.black)),
                        ],
                      ))))
              .toList()),
    );
  }
}
