import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_config/theme.dart';
import 'package:woless/_routes/main.dart';

void main() {
  runApp(const MyApp());
}

class AppRouterDelegate extends GetDelegate {
  // final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  // @override
  // List<NavigatorObserver>? get navigatorObservers => [routeObserver];

  // @override
  // PopMode get backButtonPopMode => PopMode.History;

  GetNavConfig get prevRoute =>
      history.length < 2 ? history.last : history[history.length - 2];

  @override
  Future<GetNavConfig> popHistory() async {
    final result = prevRoute;
    Get.rootDelegate.offNamed(prevRoute.currentPage!.name);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey mainNavigatorKey = GlobalKey();
    return Navigator(
      key: mainNavigatorKey,
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute('/')!.currentPage!],
    );
  }
}

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

// final GoRouter _router = GoRouter(
//   initialLocation: '/',
//   // routes: routes(),
//   routes: [
//     ShellRoute(
//       routes: routesGo(),
//       builder: (context, state, child) =>
//           Scaffold(body: child, bottomNavigationBar: BottomNavigationWidget()),
//     )
//   ],
// );

final navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.noTransition,
      transitionDuration: Duration.zero,
      title: 'Woless',
      theme: themeConfig(),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      getPages: routes(),
      // home: const Scaffold(bottomNavigationBar: BottomNavigationWidget()),
      // routerDelegate: Get.rootDelegate,
      // routerDelegate: _router.routerDelegate,
      // routeInformationParser: _router.routeInformationParser,
      // routeInformationProvider: _router.routeInformationProvider,
      // backButtonDispatcher: _router.backButtonDispatcher,
      // backButtonDispatcher: MyBackButtonDispatcher(),
      // navigatorKey: Get.key,
      // builder: (ctxParent, state) => GetRouterOutlet.builder(
      //   routerDelegate: Get.rootDelegate,
      //   key: navKey,
      //   builder: (ctx, delegate, currentRoute) {
      //     // log('${currentRoute!.currentPage}');
      //     return Scaffold(
      //         body: GetRouterOutlet(
      //           navigatorKey: delegate.navigatorKey,
      //           delegate: delegate,
      //           initialRoute: '/',
      //           anchorRoute: '/',
      //           // filterPages: (afterAnchor) {
      //           //   return afterAnchor.take(1);
      //           // },
      //         ),
      //         bottomNavigationBar: BottomNavigationWidget(delegate: delegate));
      //   },
      // ),
    );
  }
}
