import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:woless/pages/chat/main.dart';
import 'package:woless/pages/home/main.dart';
import 'package:woless/pages/likes/main.dart';
import 'package:woless/pages/profile/main.dart';
import 'package:woless/pages/search/main.dart';

// class PageMiddelware extends GetMiddleware {
//   @override
//   void onPageDispose() {
//     // log('onPageDispose');
//     super.onPageDispose();
//   }

//   @override
//   GetPage? onPageCalled(GetPage? page) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.white,
//       systemStatusBarContrastEnforced: true,
//       statusBarIconBrightness: Brightness.dark, // Android
//       statusBarBrightness: Brightness.dark, // IOS
//     ));
//     return super.onPageCalled(page);
//   }
// }

class Route {
  final String name;
  final Widget page;
  final List<GetMiddleware>? middlewares;
  final String? label;
  final IconData? icon;
  final IconData? activeIcon;

  Route(
      {required this.name,
      required this.page,
      this.middlewares,
      this.label,
      this.icon,
      this.activeIcon});
}

List<Route> menusNav = [
  Route(
    name: '/',
    page: const HomeApp(),
    // middlewares: [PageMiddelware()],
    label: 'Beranda',
    icon: Iconsax.home_2,
    activeIcon: Iconsax.home_25,
  ),
  Route(
    name: '/search',
    page: const SearchApp(),
    // middlewares: [PageMiddelware()],
    label: 'Pencarian',
    icon: Iconsax.search_normal_1,
    activeIcon: Iconsax.search_normal_1,
  ),
  Route(
    name: '/chat',
    page: const ChatApp(),
    // middlewares: [PageMiddelware()],
    label: 'Pesan',
    icon: Iconsax.message,
    activeIcon: Iconsax.message5,
  ),
  Route(
    name: '/likes',
    page: const LikesApp(),
    // middlewares: [PageMiddelware()],
    label: 'Disukai',
    icon: Iconsax.heart,
    activeIcon: Iconsax.heart5,
  ),
  Route(
    name: '/profile',
    page: const ProfileApp(),
    // middlewares: [PageMiddelware()],
    label: 'Akun',
    icon: Iconsax.profile_circle,
    activeIcon: Iconsax.profile_circle5,
  ),
];

List<Route> allRoutes = [...menusNav];

List<GetPage> routes() {
  return allRoutes
      .map((e) => GetPage(
            name: e.name,
            middlewares: e.middlewares,
            page: () => PopScope(
                canPop: false,
                onPopInvoked: (_) {
                  final history = Get.rootDelegate.history;
                  // final prevRoute = history.length < 2
                  //     ? history.last.currentTreeBranch.firstOrNull!.name
                  //     : history[history.length - 2].currentPage!.name;

                  final bool isNavMenu =
                      menusNav.map((m) => m.name).contains(e.name);

                  if (e.name != '/') {
                    if (!isNavMenu) {
                      history.length < 2
                          ? Get.rootDelegate.offNamed('/')
                          : Get.rootDelegate.popRoute(popMode: PopMode.History);
                      // : Get.rootDelegate
                      //     .backUntil(prevRoute, popMode: PopMode.History);
                    } else if (isNavMenu) {
                      Get.rootDelegate.offNamed('/');
                    }
                  }
                },
                child: e.page),
            preventDuplicates: false,
            participatesInRootNavigator: true,
          ))
      .toList();
}

// List<GoRoute> routesGo() {
//   return allRoutes
//       .map((e) => GoRoute(
//             path: e.name,
//             name: e.name,
//             pageBuilder: (context, state) => NoTransitionPage(
//               key: state.pageKey,
//               child: e.page,
//             ),
//           ))
//       .toList();
// }
