import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woless/_widgets/post_card.dart';
import 'package:woless/pages/home/main.dart';

class PostSectionController extends HomepageController {}

class PostSection extends StatelessWidget {
  const PostSection({super.key});

  final int crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    final store = Get.put(PostSectionController());
    List<PostState> postData = [
      PostState(
        title: 'Jasa penanaman padi dan pupuk organik (1 hari beres)',
        category: 'Perkebunan',
        image: 'assets/images/sample/farm.jpg',
        priceFrom: 100000,
        priceTo: 200000,
        // duration: '1 hari',
        userImage: 'assets/avatar/1.png',
        userName: 'Reja Jamil',
      ),
      PostState(
        title: 'Jasa Asisten Rumah Tangga 1 hari',
        category: 'ART',
        image: 'assets/images/sample/art-1.jpg',
        priceFrom: 150000,
        priceTo: 225000,
        duration: 'hari',
        userImage: 'assets/avatar/2.png',
        userName: 'Reja Jamil',
      ),
      PostState(
        title: 'Jasa Asisten Rumah Tangga',
        category: 'ART',
        image: 'assets/images/sample/art-2.jpg',
        priceFrom: 100000,
        priceTo: 150000,
        duration: 'hari',
        userImage: 'assets/avatar/3.png',
        userName: 'Reja Jamil',
      ),
      PostState(
        title: 'Pengasuh Anak',
        category: 'Pengasuh',
        image: 'assets/images/sample/baby-sitter.jpg',
        priceFrom: 25000,
        // priceTo: 150000,
        duration: 'jam',
        userImage: 'assets/avatar/4.png',
        userName: 'Reja Jamil',
      ),
      PostState(
        title: 'Potong Rambut Panggilan',
        category: 'Potong Rambut',
        image: 'assets/images/sample/cukur.jpg',
        priceFrom: 35000,
        priceTo: 50000,
        // duration: 'jam',
        userImage: 'assets/avatar/5.png',
        userName: 'Reja Jamil',
      ),
      PostState(
        title: 'Foto & Video Prewed',
        category: 'Foto & Videografi',
        image: 'assets/images/sample/prewed.jpg',
        priceFrom: 3000000,
        priceTo: 9000000,
        // duration: 'jam',
        userImage: 'assets/avatar/6.png',
        userName: 'Reja Jamil',
      ),
    ];

    return Obx(() {
      final pageIsReady = store.loadingPage.value;
      if (pageIsReady) {
        return NotificationListener<ScrollNotification>(
          onNotification: (e) {
            return true;
          },
          child: GridView.count(
            clipBehavior: Clip.antiAlias,
            childAspectRatio: 2 / 3,
            crossAxisCount: crossAxisCount,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // controller:
            //     ScrollController(keepScrollOffset: false),
            scrollDirection: Axis.vertical,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: postData.map((item) {
              return PostCard(item: item, crossAxisCount: crossAxisCount);
            }).toList(),
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: List.generate(
            2,
            (index) => Container(
              width: (MediaQuery.of(context).size.width / 2) - 20,
              height: 75,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
          ),
        ),
      );
    });
  }
}
