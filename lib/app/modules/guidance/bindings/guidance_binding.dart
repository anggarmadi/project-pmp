import 'package:get/get.dart';

import '../controllers/guidance_controller.dart';

class GuidanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuidanceController>(
      () => GuidanceController(),
    );
  }
}
