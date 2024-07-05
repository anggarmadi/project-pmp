import 'dart:convert';

import 'package:bimbingan_akademik/app/models/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExamCardController extends GetxController {
  RxString nama = ''.obs;
  RxString nim = ''.obs;
  RxString departemen = ''.obs;


  @override
  void onInit() {
    super.onInit();
    getProfile(); // Call getProfile when controller initializes
  }

  Future<void> getProfile() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      var user;
      var userString = prefs.getString("user");
      if (userString != null) {
        user = UserModel.fromJson(json.decode(userString));

        nama.value = user.profile.name;
        nim.value = user.profile.nim;
        departemen.value = user.profile.departmentName;

        print('nama: $nama');
        print('nim: $nim');
        print('departemen: $departemen');
      }

      
    } catch (e) {
      print('Error: $e');
    }
  }
}
