import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_widgets/button.dart';
import 'package:woless/_widgets/form.dart';
import 'package:woless/_widgets/loader.dart';
import 'package:woless/pages/chat/card_list.dart';

class ChatController extends GetxController {
  RxBool pageIsReady = false.obs;
  @override
  void onReady() {
    pageIsReady.value = true;
    super.onReady();
  }
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Get.put(ChatController());
    const double searchPadding = 15;
    return Obx(() {
      final pageIsReady = store.pageIsReady.value;
      if (pageIsReady) {
        return Scaffold(
          body: RefreshIndicator(
            color: Theme.of(context).primaryColor,
            displacement: 75,
            onRefresh: () async {
              return Future.delayed(const Duration(milliseconds: 2000));
            },
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  stretch: true,
                  stretchTriggerOffset: 20,
                  onStretchTrigger: () async {},
                  shadowColor: Colors.black.withOpacity(0.25),
                  automaticallyImplyLeading: false,
                  surfaceTintColor: Colors.transparent,
                  expandedHeight: 85,
                  toolbarHeight: kToolbarHeight + searchPadding,
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1.15,
                    centerTitle: true,
                    titlePadding: const EdgeInsets.all(0.0),
                    title: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: const EdgeInsetsDirectional.only(
                          bottom: searchPadding),
                      child: const SearchField(),
                    ),
                    background: Image.asset(
                      'assets/images/header-2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 0, vertical: searchPadding),
                      child: Column(
                        children: List.generate(
                          10,
                          (index) => LinkWell(
                              to: '/chat/detail',
                              child: ChatCard(
                                  dummyIndex: Random().nextInt(6) + 1)),
                        ),
                      ),
                    );
                  }, childCount: 1),
                ),
              ],
            ),
          ),
        );
      }
      return const ChatPageLoader();
    });
  }
}
