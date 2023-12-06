import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetail extends GetView {
  const ChatDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('CHAT DETAIL'),
              ElevatedButton(
                onPressed: () => {Get.rootDelegate.offNamed('/chat')},
                child: const Text('GO HOME'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
