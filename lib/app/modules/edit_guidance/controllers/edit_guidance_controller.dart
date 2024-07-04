import 'package:bimbingan_akademik/app/models/gudance.dart';
import 'package:flutter/material.dart';
import 'package:bimbingan_akademik/app/models/user_model.dart';
import 'package:bimbingan_akademik/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditGuidanceController extends GetxController {
  final Counselling counselling = Get.arguments;
  TextEditingController tanggalC = TextEditingController();
  TextEditingController perihalC = TextEditingController();
  TextEditingController catatanC = TextEditingController();
  TextEditingController deskC = TextEditingController();
  var id = "".obs;
  var dateTime = "".obs;
  var selectedTopic = "".obs;
  var topics = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTopics();
  }

  void fetchTopics() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      var userString = prefs.getString("user");
      if (userString != null) {
        var user = UserModel.fromJson(json.decode(userString));
        var token = user.authorization.token;

        final Map<String, String> headers = {
          'Authorization': "Bearer $token",
        };
        final response = await http.get(
            Uri.parse('https://backend-pmp.unand.dev/api/counselling-topics'),
            headers: headers);
        if (response.statusCode == 200) {
          List<dynamic> data = jsonDecode(response.body)['data'];
          topics.value = data
              .map((topic) => {
                    'id': topic['id'].toString(),
                    'name': topic['name'],
                  })
              .toList();
        } else {
          Get.snackbar('Error', 'Failed to fetch topics');
        }
      }
    } catch (e) {
      print('Error fetching topics: $e');
    }
  }

  Future<void> editCounseling() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      print(
          "Datanya ada: ${dateTime.value}, ${deskC.text}, ${counselling.counsellingTopicId}");
      var userString = prefs.getString("user");
      if (userString != null) {
        var user = UserModel.fromJson(json.decode(userString));
        var token = user.authorization.token;
        if (token != null) {
          final Map<String, String> headers = {
            'Authorization': "Bearer $token",
            'Content-Type': 'application/json',
          };

          var response = await http.put(
            Uri.parse('https://backend-pmp.unand.dev/api/my-counsellings/$id'),
            headers: headers,
            body: json.encode({
              'date': dateTime.value,
              'description': deskC.text,
              'topic_id': counselling.counsellingTopicId,
            }),
          );

          if (response.statusCode == 200) {
            print('Counseling added successfully');
            Get.snackbar('Berhasil', 'Berhasil mengedit Bimbingan');
            Get.toNamed(Routes.GUIDANCE);
            // Optionally, refresh your counseling list here
          } else {
            print('Failed to add counseling');
            Get.snackbar('Gagal', 'Gagal mengedit Bimbingan');
          }
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
