import 'dart:convert';

import 'package:bimbingan_akademik/app/controllers/page_index_controller.dart';
import 'package:bimbingan_akademik/app/models/user_model.dart';
import 'package:bimbingan_akademik/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  List<UserModel> userLogin = [];
  RxBool isHiden = true.obs;
  RxBool isLoading = false.obs;

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    final pageC = Get.find<PageIndexController>();
    List<UserModel> userLogin = [];

    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      try {
        var login = await http
            .post(Uri.parse("https://backend-pmp.unand.dev/api/login"), body: {
          "email": emailC.text,
          "password": passC.text,
        });

        if (login.statusCode == 200) {
          var data = (json.decode(login.body) as Map<String, dynamic>)["data"];
          var user = UserModel.fromJson(data);
          userLogin.add(user);

          // Simpan token dan data user dalam SharedPreferences
          await prefs.setString('user', json.encode(user.toJson()));

          Get.snackbar("Berhasil", "Berhasil Login");
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar("Terjadi Kesalahan", "Login gagal");
        }
      } catch (e) {
        Get.snackbar("Terjadi Kesalahan", "$e");
        print(e);
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Email dan Password wajib diisi");
    }
  }
}
