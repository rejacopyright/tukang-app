import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.pageIsReady,
  });

  final bool pageIsReady;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: pageIsReady
          ? Image.asset(
              'assets/images/header-1.jpg',
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
    );
  }
}
