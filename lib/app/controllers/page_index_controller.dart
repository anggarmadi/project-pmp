import 'package:bimbingan_akademik/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;
  RxInt selectedIndex = 0.obs;
  void changePage(int i) async {
    print('click index=$i');
    pageIndex.value = i;
    switch (i) {
      case 1:
        Get.offAllNamed(Routes.CLASS);
        break;
      case 2:
        Get.offAllNamed(Routes.GUIDANCE);
        print("Pindah ke 2");
        break;
      default:
        Get.offAllNamed(Routes.HOME);
    }
  }

  void navigation(int i) async {
    selectedIndex.value = i;
    switch (i) {
      case 1:
        Get.offAllNamed(Routes.CLASS);
        break;
      case 2:
        Get.offAllNamed(Routes.GUIDANCE);
        break;
      default:
        Get.offAllNamed(Routes.HOME);
    }
  }
}
