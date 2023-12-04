import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:woless/_config/services.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, this.description, this.label});

  final String? description;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(31, 125, 125, 125),
            ),
            padding: const EdgeInsets.all(10),
            child: Center(child: Text(description ?? 'description')),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 1.5),
            child: Text(
              label ?? 'Title',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10.5),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class StackedUserCard extends StatelessWidget {
  const StackedUserCard({super.key, this.avatar});

  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          width: 60,
          height: 60,
          child: Image.asset(
            avatar ?? 'assets/avatar/user.png',
            fit: BoxFit.cover,
            opacity: AlwaysStoppedAnimation(avatar != null ? 1 : 0.15),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 5,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  'Reja Jamil',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  servicesList[Random().nextInt(10) + 1].label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RatingBarIndicator(
                  rating: Random().nextInt(5) + 1,
                  unratedColor: const Color(0xffdddddd),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 10,
                  direction: Axis.horizontal,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2.5),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(spacing: 2, children: [
                  const Icon(Icons.check_circle, size: 9, color: Colors.green),
                  Text(
                    '${((Random().nextDouble() * 99) + 1).toStringAsFixed(1)}K',
                    style: const TextStyle(
                        fontSize: 9, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
