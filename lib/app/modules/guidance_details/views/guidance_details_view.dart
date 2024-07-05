import 'package:bimbingan_akademik/app/models/gudance.dart';
import 'package:bimbingan_akademik/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../controllers/guidance_details_controller.dart';

class GuidanceDetailsView extends GetView<GuidanceDetailsController> {
  final Counselling counselling = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'id';
    initializeDateFormatting('id');
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        title: const Text('Detail Bimbingan'),
        centerTitle: true,
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  counselling.status == 0
                      ? "Belum diverifikasi"
                      : "Sudah diverifikasi",
                  style: TextStyle(
                    color: counselling.status == 0
                        ? Color(0xFFFF6F00)
                        : Color(0xFF008043),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  counselling.topicName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat.yMMMMEEEEd().format(counselling.date),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  counselling.details.isNotEmpty
                      ? counselling.details.first.description
                      : "Tidak ada deskripsi",
                  style: TextStyle(),
                ),
                SizedBox(height: 16),
                if (counselling.status == 0)
                  ElevatedButton(
                    onPressed: () => Get.toNamed(
                      Routes.EDIT_GUIDANCE,
                      arguments: counselling,
                    ),
                    child: Text(
                      "Ubah",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF008043),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: Size(Get.width, 50),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
