import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:woless/_config/theme.dart';
import 'package:woless/_layouts/bottom_navigation_bar.dart';
import 'package:woless/_routes/main.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  // routes: routes(),
  routes: [
    ShellRoute(
      routes: routes(),
      builder: (context, state, child) => Scaffold(
          body: child, bottomNavigationBar: const BottomNavigationWidget()),
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // title: 'Flutter Demo',
      theme: themeConfig(),
      showPerformanceOverlay: false,
      routerConfig: _router,
    );
  }
}
