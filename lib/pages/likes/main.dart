import 'dart:math';

import 'package:flutter/material.dart';
import 'package:woless/pages/chat/card_list.dart';

class LikesApp extends StatelessWidget {
  const LikesApp({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: Container(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 0, vertical: searchPadding),
            child: ListView(
                children: List.generate(
                    10,
                    (index) =>
                        ChatCard(dummyIndex: Random().nextInt(6) + 1)))));
  }
}
