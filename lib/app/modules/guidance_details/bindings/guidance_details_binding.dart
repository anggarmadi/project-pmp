import 'package:get/get.dart';

import '../controllers/guidance_details_controller.dart';

class GuidanceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuidanceDetailsController>(
      () => GuidanceDetailsController(),
    );
  }
}
