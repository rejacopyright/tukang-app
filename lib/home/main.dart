import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:woless/home/banner_promo.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final double expandedHeight = 150.0;
  final double toolbarHeight = 0.0;

  @override
  void dispose() {
    log('disposes');
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemStatusBarContrastEnforced: true,
      statusBarIconBrightness: Brightness.dark, // Android
      statusBarBrightness: Brightness.dark, // IOS
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (e) {
          print('handle exit app');
        },
        child: Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Colors.amber,
            //   title: const Text('Title', style: TextStyle(color: Colors.black)),
            // ),
            body: CustomScrollView(
                // physics: const BouncingScrollPhysics(),
                slivers: [
              SliverLayoutBuilder(
                  builder: (BuildContext context, sliverConstraints) {
                final bool isCollapsed =
                    sliverConstraints.scrollOffset + toolbarHeight >
                        expandedHeight;
                final Brightness statusBarColor =
                    isCollapsed ? Brightness.dark : Brightness.light;
                return SliverAppBar(
                  pinned: true,
                  snap: false,
                  floating: false,
                  stretch: false,
                  expandedHeight: expandedHeight,
                  collapsedHeight: toolbarHeight,
                  toolbarHeight: toolbarHeight,
                  surfaceTintColor: Colors.transparent,
                  centerTitle: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:
                        isCollapsed ? Colors.white : Colors.transparent,
                    systemStatusBarContrastEnforced: true,
                    statusBarIconBrightness: statusBarColor, // Android
                    statusBarBrightness: statusBarColor, // IOS
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    // titlePadding: const EdgeInsets.all(0.0),
                    // title: const AnimatedOpacity(
                    //     duration: Duration(milliseconds: 300),
                    //     opacity: 1.0,
                    //     child: Text(
                    //       'Home',
                    //       style: TextStyle(fontSize: 12.0, color: Colors.black),
                    //     )),
                    background: Image.asset(
                      'assets/images/wedding_bg.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                        // mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: BannerPromo()),
                          GridView.count(
                              crossAxisCount: 3,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 7.5),
                              physics: const NeverScrollableScrollPhysics(),
                              // childAspectRatio: 3 / 1,
                              shrinkWrap: true,
                              // controller:
                              //     ScrollController(keepScrollOffset: false),
                              scrollDirection: Axis.vertical,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              children: List.generate(
                                  30,
                                  (index) => CardHome(
                                      description:
                                          'Lorem ipsums ${index + 1}'))),
                          const Padding(padding: EdgeInsets.only(bottom: 5))
                        ]);
                  },
                  childCount: 1,
                ),
              ),
            ])));
  }
}

class CardHome extends StatelessWidget {
  const CardHome({super.key, required this.description});

  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(31, 125, 125, 125),
        ),
        padding: const EdgeInsets.all(10),
        child: Center(child: Text(description)));
  }
}
