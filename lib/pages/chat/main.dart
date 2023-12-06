import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: false,
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
                      child: SizedBox(
                          height: 40,
                          child: TextField(
                            maxLines: 1,
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xfff5f5f5),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Search user here',
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                                prefixIcon: const Icon(Iconsax.search_normal_1,
                                    size: 15),
                                prefixIconColor: Theme.of(context).primaryColor,
                                prefixIconConstraints: const BoxConstraints(
                                    maxWidth: 35, minWidth: 35)),
                          ))),
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
                      3,
                      (index) => InkWell(
                          splashFactory: InkSplash.splashFactory,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Future.delayed(const Duration(milliseconds: 200),
                                () {
                              Get.rootDelegate.toNamed('/app/chat/detail');
                            });
                          },
                          child: ChatCard(dummyIndex: Random().nextInt(6) + 1)),
                    ),
                  ),
                );
              }, childCount: 1))
            ],
          ),
        );
      }
      return const ChatPageLoader();
    });
  }
}
