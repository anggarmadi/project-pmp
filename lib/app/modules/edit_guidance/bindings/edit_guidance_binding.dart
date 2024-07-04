import 'package:get/get.dart';

import '../controllers/edit_guidance_controller.dart';

class EditGuidanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditGuidanceController>(
      () => EditGuidanceController(),
    );
  }
}
