import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:woless/chat/main.dart';
import 'package:woless/home/main.dart';
import 'package:woless/likes/main.dart';
import 'package:woless/profile/main.dart';
import 'package:woless/search/main.dart';

class Route {
  final String name;
  final Widget page;
  final String? label;
  final IconData? icon;
  final IconData? activeIcon;

  Route(
      {required this.name,
      required this.page,
      this.label,
      this.icon,
      this.activeIcon});
}

List<Route> menus = [
  Route(
    name: '/',
    page: const HomeApp(),
    label: 'Homes',
    icon: Iconsax.home_2,
    activeIcon: Iconsax.home_25,
  ),
  Route(
    name: '/search',
    page: const SearchApp(),
    label: 'Pencarian',
    icon: Iconsax.search_normal_1,
    activeIcon: Iconsax.search_normal_1,
  ),
  Route(
    name: '/chat',
    page: const ChatApp(),
    label: 'Pesan',
    icon: Iconsax.message,
    activeIcon: Iconsax.message5,
  ),
  Route(
    name: '/likes',
    page: const LikesApp(),
    label: 'Disukai',
    icon: Iconsax.heart5,
    activeIcon: Iconsax.heart5,
  ),
  Route(
    name: '/profile',
    page: const ProfileApp(),
    label: 'Akun',
    icon: Iconsax.profile_circle,
    activeIcon: Iconsax.profile_circle5,
  ),
];

List<GetPage> routes() {
  return menus
      .map((e) => GetPage(
            name: e.name,
            page: () => PopScope(canPop: false, child: e.page),
            preventDuplicates: true,
          ))
      .toList();
}

List<GoRoute> routesGo() {
  return menus
      .map((e) => GoRoute(
            path: e.name,
            name: e.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: e.page,
            ),
          ))
      .toList();
}
