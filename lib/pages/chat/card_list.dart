import 'dart:math';

import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, this.dummyIndex});
  final int? dummyIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor, shape: BoxShape.circle),
            child: Image.asset('assets/avatar/$dummyIndex.png',
                fit: BoxFit.cover, width: double.infinity),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Reja Jamil',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                      style: const TextStyle(color: Colors.black45),
                      softWrap: false,
                      maxLines: Random().nextInt(2) + 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '12:30',
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                  Random().nextInt(2) + 1 == 1
                      ? Container(
                          height: 15,
                          padding: const EdgeInsets.only(
                              bottom: 1, left: 5, right: 5),
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: const Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ))
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
