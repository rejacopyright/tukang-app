import 'package:get/get.dart';

class BottomNavStore extends GetxController {
  RxString activePage = '/'.obs;
  RxBool nav = true.obs;
  setActivePage(e) => activePage.value = e;
  showNav(e) => nav.value = e;
}
