import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/exam_card_controller.dart';

class ExamCardView extends GetView<ExamCardController> {
  const ExamCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        title: const Text('Kartu Ujian'),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            SizedBox(height: 80),
            Column(
              children: [
                Container(
                  // alignment: Alignment.center,
                  width: Get.width * 0.7,
                  height: Get.width * 0.7,
                  child: Image.asset("assets/img/Qr_code.png"),
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                gradient: const LinearGradient(
                    colors: [
                      Color(0xFF00A254),
                      Color.fromARGB(255, 6, 105, 59),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.1, 1.0],
                    tileMode:
                        TileMode.clamp), // Change this to adjust corner radius
              ),
              width: Get.width,
              child: Column(
                children: [
                   Row(
                    children: [
                       Obx(()=> CircleAvatar(
                        backgroundColor: Colors.black26,
                        radius: 30,
                        backgroundImage:
                            NetworkImage("https://ui-avatars.com/api/?name=${controller.nama.value.replaceAll(' ', '-')}}"),
                      )),
                      SizedBox(width: 10),
                      Expanded(
                        child: Obx(() => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.nama.value,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        controller.nim.value,
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                        controller.departemen.value,
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
