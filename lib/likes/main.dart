import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LikesApp extends StatelessWidget {
  const LikesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Likes PAGEx'),
      ElevatedButton(
          onPressed: () {
            context.goNamed('/');
            log('Go Back');
          },
          child: const Text('Go Back')),
    ])));
  }
}
