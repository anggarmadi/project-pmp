import 'package:get/get.dart';

import '../controllers/exam_card_controller.dart';

class ExamCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamCardController>(
      () => ExamCardController(),
    );
  }
}
