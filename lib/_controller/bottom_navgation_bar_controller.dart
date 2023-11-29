import 'package:get/get.dart';

class BottomNavStore extends GetxController {
  RxString activePage = '/'.obs;
  setActivePage(e) => activePage.value = e;
}
