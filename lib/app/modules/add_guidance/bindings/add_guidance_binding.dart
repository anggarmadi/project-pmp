import 'package:get/get.dart';

import '../controllers/add_guidance_controller.dart';

class AddGuidanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddGuidanceController>(
      () => AddGuidanceController(),
    );
  }
}
