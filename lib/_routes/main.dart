import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:woless/pages/chat/detail/main.dart';
import 'package:woless/pages/chat/main.dart';
import 'package:woless/pages/home/coba.dart';
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

class Scoper extends StatelessWidget {
  const Scoper({
    super.key,
    required this.name,
    required this.child,
  });
  final String name;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        final history = Get.rootDelegate.history;
        // final prevRoute = history.length < 2
        //     ? history.last.currentTreeBranch.firstOrNull!.name
        //     : history[history.length - 2].currentPage!.name;

        final bool isNavMenu = menusNav.map((m) => m.name).contains(name);

        if (!['/', '/app'].contains(name)) {
          if (!isNavMenu) {
            history.length < 2
                ? Get.rootDelegate.offNamed('/app')
                : Get.rootDelegate.popRoute(popMode: PopMode.History);
            // : Get.rootDelegate
            //     .backUntil(prevRoute, popMode: PopMode.History);
          } else if (isNavMenu) {
            Get.rootDelegate.offNamed('/app');
          }
        }
      },
      child: child,
    );
  }
}

class Route {
  final String name;
  final Widget page;
  final List<GetMiddleware>? middlewares;
  final String? label;
  final IconData? icon;
  final IconData? activeIcon;
  final List<GetPage>? children;

  Route({
    required this.name,
    required this.page,
    this.middlewares,
    this.label,
    this.icon,
    this.activeIcon,
    this.children,
  });
}

List<Route> menusNav = [
  Route(
    name: '/app',
    page: const Scoper(name: '/app', child: HomeApp()),
    // middlewares: [PageMiddelware()],
    label: 'Beranda',
    icon: Iconsax.home_2,
    activeIcon: Iconsax.home_25,
    children: [
      GetPage(
        name: '/coba',
        page: () => const HomeCoba(),
      ),
    ],
  ),
  Route(
    name: '/search',
    page: const Scoper(name: '/search', child: SearchApp()),
    // middlewares: [PageMiddelware()],
    label: 'Pencarian',
    icon: Iconsax.search_normal_1,
    activeIcon: Iconsax.search_normal_1,
  ),
  Route(
    name: '/chat',
    page: const Scoper(name: '/chat', child: ChatApp()),
    // middlewares: [PageMiddelware()],
    label: 'Pesan',
    icon: Iconsax.message,
    activeIcon: Iconsax.message5,
    children: [
      GetPage(
        name: '/detail',
        page: () => const ChatDetail(),
      ),
    ],
  ),
  Route(
    name: '/likes',
    page: const Scoper(name: '/likes', child: LikesApp()),
    // middlewares: [PageMiddelware()],
    label: 'Disukai',
    icon: Iconsax.heart,
    activeIcon: Iconsax.heart5,
  ),
  Route(
    name: '/profile',
    page: const Scoper(name: '/profile', child: ProfileApp()),
    // middlewares: [PageMiddelware()],
    label: 'Akun',
    icon: Iconsax.profile_circle,
    activeIcon: Iconsax.profile_circle5,
  ),
];

List<GetPage> routes() {
  return [
    GetPage(
      name: '/',
      page: () => const Scoper(name: '/', child: HomeApp()),
      children: [
        GetPage(
          name: '/app',
          page: () => const Scoper(name: '/app', child: HomeApp()),
          children: [
            ...(menusNav.firstWhereOrNull((e) => e.name == '/app')!.children ??
                []),
            ...menusNav.where((e) => e.name != '/app').map((e) => GetPage(
                  name: e.name,
                  page: () => e.page,
                  // middlewares: e.middlewares,
                  // preventDuplicates: false,
                  // participatesInRootNavigator: true,
                  children: e.children ?? [],
                )),
          ],
        ),
      ],
    )
  ];
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
