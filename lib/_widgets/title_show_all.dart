import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TitleShowAll extends StatelessWidget {
  const TitleShowAll({super.key, this.title, this.path, this.margin});

  final String? title;
  final String? path;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).primaryColor;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 15, right: 10),
      margin: margin ?? const EdgeInsets.symmetric(vertical: 10),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? 'Title',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(5),
                child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 5),
                    // margin: const EdgeInsets.only(top: 3),
                    child: Wrap(
                        spacing: 2,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            'Selengkapnya',
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Icon(Iconsax.arrow_right_3, size: 12, color: primary),
                        ]))),
          ]),
    );
  }
}
