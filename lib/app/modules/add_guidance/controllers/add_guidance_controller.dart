// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // class AddGuidanceController extends GetxController {
// //   TextEditingController tanggalC = TextEditingController();

// // }

// import 'package:bimbingan_akademik/app/models/user_model.dart';
// import 'package:bimbingan_akademik/app/routes/app_pages.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// class AddGuidanceController extends GetxController {
//   TextEditingController tanggalC = TextEditingController();
//   TextEditingController deskC = TextEditingController();
//   var dateTime = "".obs;
//   var selectedTopic = "".obs;
//   var topics = <String>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchTopics();
//   }

//   void fetchTopics() async {
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       var user;
//       var userString = prefs.getString("user");
//       if (userString != null) {
//         user = UserModel.fromJson(json.decode(userString));
//       }

//       var token = user.authorization.token;
//       Get.snackbar('Token', token);
//       final Map<String, String> headers = {
//         'Authorization': "Bearer $token",
//       };
//       final response = await http.get(
//           Uri.parse('https://backend-pmp.unand.dev/api/counselling-topics'),
//           headers: headers);
//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body)['data'];
//         topics.value = data.map((topic) => topic['id'].toString()).toList();
//       } else {
//         Get.snackbar('Error', 'Failed to fetch topics');
//       }
//     } catch (e) {}
//   }

//   Future<void> addCounseling() async {
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       print(
//           "Datanya ada: ${dateTime.value}, ${deskC.text}, ${selectedTopic.value}");
//       var userString = prefs.getString("user");
//       if (userString != null) {
//         var user = UserModel.fromJson(json.decode(userString));
//         var token = user.authorization.token;
//         if (token != null) {
//           final Map<String, String> headers = {
//             'Authorization': "Bearer $token",
//             'Content-Type': 'application/json',
//           };

//           var response = await http.post(
//             Uri.parse('https://backend-pmp.unand.dev/api/my-counsellings'),
//             headers: headers,
//             body: json.encode({
//               'date': dateTime.value,
//               'description': deskC.text,
//               'topic_id': selectedTopic.value,
//             }),
//           );

//           if (response.statusCode == 200) {
//             print('Counseling added successfully');
//             Get.snackbar('Berhasil', 'Berhasil Menambahkan Bimbingan');
//             Get.toNamed(Routes.GUIDANCE);
//             // Optionally, refresh your counseling list here
//           } else {
//             print('Failed to add counseling');
//             Get.snackbar('Gagal', 'Gagal Menambahkan Bimbingan');
//           }
//         }
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }

import 'package:bimbingan_akademik/app/models/user_model.dart';
import 'package:bimbingan_akademik/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AddGuidanceController extends GetxController {
  TextEditingController tanggalC = TextEditingController();
  TextEditingController deskC = TextEditingController();
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

  Future<void> addCounseling() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      print(
          "Datanya ada: ${dateTime.value}, ${deskC.text}, ${selectedTopic.value}");
      var userString = prefs.getString("user");
      if (userString != null) {
        var user = UserModel.fromJson(json.decode(userString));
        var token = user.authorization.token;
        if (token != null) {
          final Map<String, String> headers = {
            'Authorization': "Bearer $token",
            'Content-Type': 'application/json',
          };

          var response = await http.post(
            Uri.parse('https://backend-pmp.unand.dev/api/my-counsellings'),
            headers: headers,
            body: json.encode({
              'date': dateTime.value,
              'description': deskC.text,
              'topic_id': selectedTopic.value,
            }),
          );

          if (response.statusCode == 200) {
            print('Counseling added successfully');
            Get.snackbar('Berhasil', 'Berhasil Menambahkan Bimbingan');
            Get.toNamed(Routes.GUIDANCE);
            // Optionally, refresh your counseling list here
          } else {
            print('Failed to add counseling');
            Get.snackbar('Gagal', 'Gagal Menambahkan Bimbingan');
          }
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
