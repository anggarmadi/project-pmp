import 'package:get/get.dart';

class GuidanceDetailsController extends GetxController {
  // Rx<Counselling> counsellingDetail = Counselling(
  //   id: '',
  //   studentId: '',
  //   counsellorId: '',
  //   counsellingTopicId: '',
  //   periodId: '',
  //   date: DateTime.now(),
  //   status: 0,
  //   file: '',
  //   createdAt: DateTime.now(),
  //   updatedAt: DateTime.now(),
  //   details: [],
  //   topic: '',
  //   topicName: '',
  // ).obs;
  // String id = Get.arguments;

  // var counsellingTopics = <CounsellingTopic>[].obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   print("parameternya $id"); // Get the passed id from the arguments
  //   getCounsellingDetail(id);
  // }

  // Future<void> getCounsellingDetail(String id) async {
  //   final prefs = await SharedPreferences.getInstance();

  //   try {
  //     var userString = prefs.getString("user");
  //     if (userString != null) {
  //       var user = UserModel.fromJson(json.decode(userString));
  //       var token = user.authorization.token;

  //       if (token != null) {
  //         final Map<String, String> headers = {
  //           'Authorization': "Bearer $token",
  //         };

  //         // Fetch counselling topics
  //         var topicResponse = await http.get(
  //             Uri.parse('https://backend-pmp.unand.dev/api/counselling-topics'),
  //             headers: headers);
  //         if (topicResponse.statusCode == 200) {
  //           var topicData = json.decode(topicResponse.body)['data'] as List;
  //           counsellingTopics.value = topicData
  //               .map((topic) => CounsellingTopic.fromJson(topic))
  //               .toList();
  //         }

  //         // Fetch counsellings
  //         var responseCounselling = await http.get(
  //           Uri.parse("https://backend-pmp.unand.dev/api/my-counsellings"),
  //           headers: headers,
  //         );

  //         if (responseCounselling.statusCode == 200) {
  //           var data = json.decode(responseCounselling.body);
  //           var guidanceResponse = Guidance.fromJson(data);

  //           if (guidanceResponse.counts > 0) {
  //             var selectedCounselling = guidanceResponse.counsellings
  //                 .firstWhereOrNull((counselling) => counselling.id == id);

  //             if (selectedCounselling != null) {
  //               // Find the topic name based on the counselling topic id
  //               var topic = counsellingTopics.firstWhereOrNull((topic) =>
  //                   topic.id == selectedCounselling.counsellingTopicId);
  //               if (topic != null) {
  //                 selectedCounselling.topicName = topic.name;
  //               }
  //               counsellingDetail.value = selectedCounselling;
  //               print('Counselling Detail: $counsellingDetail');
  //             }
  //           }
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
}
