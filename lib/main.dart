import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_config/theme.dart';
import 'package:woless/_layouts/bottom_navigation_bar.dart';
import 'package:woless/_routes/main.dart';

void main() {
  runApp(const MyApp());
}

final navKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentPagName = '/';
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // smartManagement: SmartManagement.onlyBuilder,
      defaultTransition: Transition.noTransition,
      transitionDuration: Duration.zero,
      title: 'Woless',
      theme: themeConfig(),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      getPages: routes(),
      // routerDelegate: Get.rootDelegate,
      // routerDelegate: _router.routerDelegate,
      // routeInformationParser: _router.routeInformationParser,
      // routeInformationProvider: _router.routeInformationProvider,
      // backButtonDispatcher: _router.backButtonDispatcher,
      // navigatorKey: Get.key,
      builder: (ctxParent, state) => GetRouterOutlet.builder(
        routerDelegate: Get.rootDelegate,
        key: navKey,
        builder: (ctx, delegate, currentRoute) {
          final String name =
              currentRoute != null ? currentRoute.currentPage!.name : '/app';
          return Scaffold(
              body: GetRouterOutlet(
                navigatorKey: delegate.navigatorKey,
                delegate: delegate,
                initialRoute: '/app',
                anchorRoute: '/',
                // filterPages: (afterAnchor) {
                //   return afterAnchor.take(1);
                // },
              ),
              bottomNavigationBar: BottomNavigationWidget(
                  name: name != '/app' ? name.replaceAll('/app', '') : name));
        },
      ),
    );
  }
}
