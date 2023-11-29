import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:woless/_config/theme.dart';
import 'package:woless/_layouts/bottom_navigation_bar.dart';
import 'package:woless/_routes/main.dart';

void main() {
  runApp(const MyApp());
}

// class AppRouterDelegate extends GetDelegate {
//   // GetNavConfig get prevRoute =>
//   //     history.length < 2 ? history.last : history[history.length - 2];

//   // @override
//   // Future<GetNavConfig> popHistory() async {
//   //   final result = prevRoute;
//   //   Get.rootDelegate.offNamed(prevRoute.currentPage!.name);
//   //   return result;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     GlobalKey mainNavigatorKey = GlobalKey();
//     return Navigator(
//       key: mainNavigatorKey,
//       onPopPage: (route, result) => route.didPop(result),
//       pages: currentConfiguration != null
//           ? [currentConfiguration!.currentPage!]
//           : [GetNavConfig.fromRoute('/')!.currentPage!],
//     );
//   }
// }

// class MyBackButtonDispatcher extends RootBackButtonDispatcher {
//   @override
//   Future<bool> didPopRoute() async {
//     if ((Get.rootDelegate.currentConfiguration?.currentTreeBranch.length ??
//             2) <=
//         1) {
//       try {
//         SystemNavigator.pop();
//       } catch (e) {
//         log('$e');
//         log('no');
//       }
//     }
//     return super.didPopRoute();
//   }
// }

final GoRouter _router = GoRouter(
  initialLocation: '/',
  // routes: routes(),
  routes: [
    ShellRoute(
      routes: routesGo(),
      builder: (context, state, child) =>
          Scaffold(body: child, bottomNavigationBar: BottomNavigationWidget()),
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      defaultTransition: Transition.noTransition,
      title: 'Woless',
      theme: themeConfig(),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      backButtonDispatcher: _router.backButtonDispatcher,
      onDispose: () {
        log('onDispose');
      },
      // routerDelegate: AppRouterDelegate(),
      // backButtonDispatcher: MyBackButtonDispatcher(),
      // getPages: routes(),
      // builder: (context, state) => GetRouterOutlet.builder(
      //   builder: (context, delegate, currentRoute) {
      //     return Scaffold(
      //         body: GetRouterOutlet(
      //           initialRoute: '/',
      //           anchorRoute: '/',
      //         ),
      //         bottomNavigationBar: BottomNavigationWidget());
      //   },
      // ),
    );
  }
}
