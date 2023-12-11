import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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

class MyBackButtonDispatcher extends RootBackButtonDispatcher {
  @override
  Future<bool> didPopRoute() async {
    if ((Get.rootDelegate.currentConfiguration?.currentTreeBranch.length ??
            2) <=
        1) {
      try {
        SystemNavigator.pop();
      } catch (e) {
        // log
      }
    }
    return super.didPopRoute();
  }
}

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