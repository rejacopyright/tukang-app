import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_widgets/button.dart';
import 'package:woless/_widgets/loader.dart';
import 'package:woless/pages/chat/card_list.dart';

class LikesController extends GetxController {
  RxBool pageIsReady = false.obs;
  @override
  void onReady() {
    pageIsReady.value = true;
    super.onReady();
  }
}

class LikesApp extends StatelessWidget {
  const LikesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Get.put(LikesController());
    const double searchPadding = 15;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Chat',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        final pageIsReady = store.pageIsReady.value;
        return pageIsReady
            ? const LikesPage(searchPadding: searchPadding)
            : const ChatPageLoader();
      }),
    );
  }
}

class LikesPage extends StatelessWidget {
  const LikesPage({
    super.key,
    required this.searchPadding,
  });

  final double searchPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: 0, vertical: searchPadding),
      child: ListView(
        children: List.generate(
          2,
          (index) => LinkWell(
            to: '/chat/detail',
            child: ChatCard(dummyIndex: Random().nextInt(6) + 1),
          ),
        ),
      ),
    );
  }
}
