import 'package:flutter/material.dart';
import 'package:woless/_widgets/form.dart';

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsetsDirectional.only(bottom: 10),
                child: const SearchField(),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return const Center(
                child: Text('Product App'),
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}
