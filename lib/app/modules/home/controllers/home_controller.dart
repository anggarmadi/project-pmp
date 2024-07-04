import 'dart:convert';
import 'package:bimbingan_akademik/app/models/counselling_topic.dart';
import 'package:bimbingan_akademik/app/models/course.dart';
import 'package:bimbingan_akademik/app/models/gudance.dart';
import 'package:bimbingan_akademik/app/models/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxString nama = ''.obs;
  RxString nim = ''.obs;
  RxString departemen = ''.obs;
  RxString total_course = "0".obs;
  var courses = <CourseElement>[].obs;
  RxInt total_counselling = 0.obs;
  var counsellings = <Counselling>[].obs;
  var counsellingTopics = <CounsellingTopic>[].obs;

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
          total_course.value = courseResponse.count.toString();
          courses.value = courseResponse.courses;
          print(courses);
        }

        // Fetch counselling topics
        var topicResponse = await http.get(
            Uri.parse('https://backend-pmp.unand.dev/api/counselling-topics'),
            headers: headers);
        print("statusnya tpoik: ${topicResponse.statusCode}");
        if (topicResponse.statusCode == 200) {
          var topicData = json.decode(topicResponse.body)['data'] as List;
          counsellingTopics.value = topicData
              .map((topic) => CounsellingTopic.fromJson(topic))
              .toList();
        }

        // Fetch counsellings
        var responseCounselling = await http.get(
            Uri.parse("https://backend-pmp.unand.dev/api/my-counsellings"),
            headers: headers);
        if (responseCounselling.statusCode == 200) {
          var data = json.decode(responseCounselling.body);
          var guidanceResponse = Guidance.fromJson(data);
          if (guidanceResponse.counts > 0) {
            total_counselling.value = guidanceResponse.counts;
            counsellings.value = guidanceResponse.counsellings;
            print('Counsellings: $counsellings');
          }

          for (var counselling in counsellings) {
            var topic = counsellingTopics.firstWhereOrNull(
                (topic) => topic.id == counselling.counsellingTopicId);
            if (topic != null) {
              counselling.topicName = topic.name;
              print(
                  'Counselling ID ${counselling.counsellingTopicId} matched with topic name: ${topic.name}');
            } else {
              print(
                  'No match for counselling ID ${counselling.counsellingTopicId}');
            }
          }
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
