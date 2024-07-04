import 'package:bimbingan_akademik/app/models/gudance.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../controllers/edit_guidance_controller.dart';

class EditGuidanceView extends GetView<EditGuidanceController> {
  final Counselling counselling = Get.arguments;

  @override
  Widget build(BuildContext context) {
    List<Detail> detail = counselling.details;
    controller.perihalC.text = counselling.topicName;
    controller.deskC.text = detail.first.description;
    var tanggal = counselling.date;
    Intl.defaultLocale = 'id';
    initializeDateFormatting('id');
    controller.tanggalC.text = DateFormat.yMMMMEEEEd().format(tanggal);
    controller.dateTime.value = counselling.date.toIso8601String();

    controller.id.value = counselling.id;
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        title: const Text('Bimbingan Akademik'),
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
                TextField(
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  controller: controller.perihalC,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Masukan Perihal Bimbingan",
                    labelText: "Perihal",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelStyle: new TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xFF008043)),
                    ),
                    // prefixIcon: Icon(Icons.mail),
                  ),
                  enabled: false,
                ),
                SizedBox(height: 16),
                TextField(
                  autocorrect: false,
                  controller: controller.tanggalC,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Tanggal Bimbingan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelStyle: new TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xFF008043)),
                    ),
                    prefixIcon: Icon(Icons.calendar_month_rounded),
                  ),
                  readOnly: true,
                  onTap: () async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      initializeDateFormatting('id');
                      String hasil = DateFormat.yMMMMEEEEd().format(date);
                      controller.tanggalC.text = hasil;
                      controller.dateTime.value = date.toIso8601String();
                    }
                  },
                ),
                SizedBox(height: 16),
                TextField(
                  autocorrect: false,
                  // textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.multiline,
                  controller: controller.deskC,
                  decoration: InputDecoration(
                    hintText: "Masukan Catatan Bimbingan",
                    labelText: "Catatan Bimbingan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelStyle: new TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xFF008043)),
                    ),
                    // prefixIcon: Icon(Icons.mail),
                  ),
                  maxLines: null,
                  minLines: 4,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    await controller.editCounseling();
                  },
                  child: Text(
                    "Ubah",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF008043),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: Size(Get.width, 50),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
