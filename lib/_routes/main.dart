import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:woless/pages/chat/detail/main.dart';
import 'package:woless/pages/chat/main.dart';
import 'package:woless/pages/home/main.dart';
import 'package:woless/pages/likes/main.dart';
import 'package:woless/pages/product/detail/main.dart';
import 'package:woless/pages/product/main.dart';
import 'package:woless/pages/profile/main.dart';
import 'package:woless/pages/search/main.dart';

// class PageMiddelware extends GetMiddleware {
//   @override
//   void onPageDispose() {
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

const String homeRoute = '/app';

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
        //     // ? history.last.currentPage!.name
        //     : history[history.length - 2].currentPage!.name;

        final bool isNavMenu = menusNav.map((m) => m.name).contains(name);

        if (!['/', homeRoute].contains(name)) {
          if (!isNavMenu) {
            history.isEmpty
                ? Get.rootDelegate.offNamed(homeRoute)
                // : Get.rootDelegate.offNamed(prevRoute);
                : Get.rootDelegate.popRoute(popMode: PopMode.Page);
            // : Get.rootDelegate
            //     .backUntil(prevRoute, popMode: PopMode.History);
          } else if (isNavMenu) {
            Get.rootDelegate.offNamed(homeRoute);
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
    name: homeRoute,
    page: const Scoper(name: homeRoute, child: HomeApp()),
    label: 'Beranda',
    icon: Iconsax.home_2,
    activeIcon: Iconsax.home_25,
    children: [
      GetPage(
        name: '/home/product/detail',
        page: () => const ProductDetail(),
      ),
    ],
  ),
  Route(
    name: '/search',
    page: const Scoper(name: '/search', child: SearchApp()),
    label: 'Temukan',
    icon: Iconsax.search_normal_1,
    activeIcon: Iconsax.search_normal_1,
  ),
  Route(
    name: '/product',
    page: const Scoper(name: '/product', child: ProductApp()),
    label: 'Disukai',
    icon: Iconsax.heart,
    activeIcon: Iconsax.heart5,
    children: [
      GetPage(
        name: '/detail',
        preventDuplicates: true,
        participatesInRootNavigator: true,
        page: () => const ProductDetail(),
      ),
    ],
  ),
  Route(
    name: '/chat',
    page: const Scoper(name: '/chat', child: ChatApp()),
    label: 'Pesan',
    icon: Iconsax.message,
    activeIcon: Iconsax.message5,
    children: [
      GetPage(
        name: '/detail',
        preventDuplicates: true,
        participatesInRootNavigator: true,
        page: () => const ChatDetail(),
      ),
    ],
  ),
  Route(
    name: '/profile',
    page: const Scoper(name: '/profile', child: ProfileApp()),
    label: 'Akun',
    icon: Iconsax.profile_circle,
    activeIcon: Iconsax.profile_circle5,
  ),
];

List<String> pageHasNav = [
  '/likes',
  ...(menusNav.map((e) => e.name)),
].map((e) => e != homeRoute ? '$homeRoute$e' : e).toList();

List<GetPage> routes() {
  return [
    GetPage(
      name: '/',
      preventDuplicates: true,
      participatesInRootNavigator: true,
      page: () => const Scoper(name: '/', child: HomeApp()),
      children: [
        GetPage(
          name: homeRoute,
          preventDuplicates: true,
          participatesInRootNavigator: true,
          page: () => const Scoper(name: homeRoute, child: HomeApp()),
          children: [
            ...(menusNav
                    .firstWhereOrNull((e) => e.name == homeRoute)!
                    .children ??
                []),
            ...menusNav.where((e) => e.name != homeRoute).map((e) => GetPage(
                  name: e.name,
                  preventDuplicates: true,
                  participatesInRootNavigator: true,
                  page: () => e.page,
                  // middlewares: e.middlewares,
                  children: e.children ?? [],
                )),
            GetPage(
              name: '/likes',
              preventDuplicates: true,
              participatesInRootNavigator: true,
              page: () => const Scoper(name: '/likes', child: LikesApp()),
              // middlewares: [PageMiddelware()],
            ),
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
