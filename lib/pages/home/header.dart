import 'package:flutter/material.dart';
import 'package:woless/_widgets/form.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.pageIsReady,
  });

  final bool pageIsReady;

  @override
  Widget build(BuildContext context) {
    const double expandedHeight = 100;
    const double toolbarHeight = 65;
    return SliverLayoutBuilder(
        builder: (BuildContext context, sliverConstraints) {
      final bool isCollapsed =
          sliverConstraints.scrollOffset + toolbarHeight > expandedHeight;
      final Color statusBarColor =
          isCollapsed ? Colors.white : Colors.transparent;
      return SliverAppBar(
        backgroundColor: statusBarColor,
        shadowColor: Colors.black.withOpacity(0.25),
        elevation: 1,
        pinned: true,
        snap: false,
        floating: false,
        stretch: true,
        stretchTriggerOffset: 20,
        expandedHeight: expandedHeight,
        collapsedHeight: toolbarHeight,
        toolbarHeight: toolbarHeight,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: const [
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
          ],
          expandedTitleScale: 1,
          centerTitle: true,
          titlePadding: const EdgeInsets.all(0.0),
          title: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: const EdgeInsetsDirectional.only(bottom: 15),
            child: const SearchField(),
          ),
          background: pageIsReady
              ? Image.asset(
                  'assets/images/header-3.jpg',
                  fit: BoxFit.cover,
                )
              : Center(
                  child: Wrap(
                    spacing: 5,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: const EdgeInsets.only(top: 35),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
