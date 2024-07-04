import 'package:bimbingan_akademik/app/controllers/page_index_controller.dart';
import 'package:bimbingan_akademik/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  final pageC = Get.put(PageIndexController(), permanent: true);
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
