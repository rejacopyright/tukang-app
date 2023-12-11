import 'package:flutter/material.dart';

class ProductDetailTabDescription extends StatelessWidget {
  const ProductDetailTabDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        9,
        (index) => const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              'Lorem Ipsum',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur ut nihil neque labore totam perferendis, unde repudiandae adipisci facilis nostrum reprehenderit facere vitae corporis quod. Obcaecati veniam, corporis beatae.'),
          ],
        ),
      ),
    );
  }
}
