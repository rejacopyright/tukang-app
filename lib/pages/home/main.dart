import 'package:flutter/material.dart';
import 'package:woless/_config/services.dart';
import 'package:woless/_widgets/title_show_all.dart';
import 'package:woless/pages/home/banner_promo.dart';
import 'package:woless/pages/home/service_card.dart';
import 'package:woless/pages/home/top_user_card.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});
  final double expandedHeight = 150.0;
  final double toolbarHeight = 0.0;

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
                // final bool isCollapsed =
                //     sliverConstraints.scrollOffset + toolbarHeight >
                //         expandedHeight;
                // final Brightness statusBarColor =
                //     isCollapsed ? Brightness.dark : Brightness.light;
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
                  // systemOverlayStyle: SystemUiOverlayStyle(
                  //   statusBarColor:
                  //       isCollapsed ? Colors.white : Colors.transparent,
                  //   systemStatusBarContrastEnforced: true,
                  //   statusBarIconBrightness: statusBarColor, // Android
                  //   statusBarBrightness: statusBarColor, // IOS
                  // ),
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
                      'assets/images/header-1.jpg',
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
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            child: BannerPromo(),
                          ),
                          const TitleShowAll(title: 'Temukan Tukang'),
                          const ServiceSection(),
                          const TitleShowAll(
                            title: 'Tukang Unggulan',
                            margin: EdgeInsets.only(top: 20, bottom: 5),
                          ),
                          TopUserCard(),
                          const Padding(padding: EdgeInsets.only(bottom: 5))
                        ]);
                  },
                  childCount: 1,
                ),
              ),
            ])));
  }
}

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      restorationId: 'home_menu',
      crossAxisCount: 6,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      physics: const NeverScrollableScrollPhysics(),
      // childAspectRatio: 0.9,
      shrinkWrap: true,
      // controller:
      //     ScrollController(keepScrollOffset: false),
      scrollDirection: Axis.vertical,
      crossAxisSpacing: 0,
      mainAxisSpacing: 10,
      children: servicesList
          .where((item) => item.home == true)
          .map((e) => ServiceCard(label: e.label, icon: e.icon))
          .toList(),
      // children: List.generate(
      //     3,
      //     (index) => CardHome(
      //         description: 'Lorem ipsums ${index + 1}')),
    );
  }
}
