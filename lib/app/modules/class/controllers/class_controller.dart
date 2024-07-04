import 'dart:convert';

import 'package:bimbingan_akademik/app/models/course.dart';
import 'package:bimbingan_akademik/app/models/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ClassController extends GetxController {
  RxString nama = ''.obs;
  RxString nim = ''.obs;
  RxString departemen = ''.obs;
  var courses = <CourseElement>[].obs;

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

      var token = user.authorization.token;
      print('tokennya: $token');

      if (token != null) {
        final Map<String, String> headers = {
          'Authorization': "Bearer $token",
        };

        // Fetch courses
        var response = await http.get(
            Uri.parse("https://backend-pmp.unand.dev/api/my-courses"),
            headers: headers);
        if (response.statusCode == 200) {
          var data = json.decode(response.body);
          var courseResponse = Course.fromJson(data);
          courses.value = courseResponse.courses;
          print(courses);
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
