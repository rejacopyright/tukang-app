import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:woless/_widgets/button.dart';
import 'package:woless/_widgets/form.dart';

class ProductDetailTopBar extends StatelessWidget {
  const ProductDetailTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shadowColor: Colors.black.withOpacity(0.25),
      elevation: 1,
      forceElevated: true,
      pinned: true,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 10, right: 15),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  clipBehavior: Clip.antiAlias,
                  child: const BackWell(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(Iconsax.arrow_left),
                    ),
                  ),
                ),
              ),
              const Expanded(child: SearchField()),
            ],
          ),
        ),
      ),
    );
  }
}
