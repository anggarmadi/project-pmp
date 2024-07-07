import 'package:bimbingan_akademik/app/controllers/page_index_controller.dart';
import 'package:bimbingan_akademik/app/routes/app_pages.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'id';
    initializeDateFormatting('id');
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: MediaQuery.of(context).size.width < 600
          ? AppBar(
              title: const Text('Bimbingan Akademik App'),
              centerTitle: true,
              backgroundColor: Color(0xFFFFFFFF),
            )
          : null,
      body: Center(
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            children: [
              if (constraints.maxWidth >= 600)
                NavigationRail(
                  leading: Column(
                    children: [
                      Container(
                        width: Get.width * 0.07,
                        height: Get.width * 0.07,
                        child: Image.asset("assets/img/unand1.png"),
                      ),
                      SizedBox(height: 15),
                      if (constraints.maxWidth >= 650)
                        Container(
                          color: Color(0xFFCCF3E3),
                          width: 260,
                          height: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() => CircleAvatar(
                                    backgroundColor: Colors.black26,
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                        "https://ui-avatars.com/api/?name=${controller.nama.value.replaceAll(' ', '-')}"),
                                  )),
                              SizedBox(width: 10),
                              Obx(() => Column(
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
                            ],
                          ),
                        ),
                      SizedBox(height: 15),
                    ],
                  ),
                  extended: constraints.maxWidth >= 650,
                  backgroundColor: Color.fromARGB(255, 6, 105, 59),
                  indicatorColor: Color(0xFFCCF3E3),
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home, color: Colors.white),
                      selectedIcon: Icon(Icons.home,
                          color: Color.fromARGB(255, 6, 105, 59)),
                      label: Text(
                        'Beranda',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.class_, color: Colors.white),
                      selectedIcon: Icon(Icons.class_,
                          color: Color.fromARGB(255, 6, 105, 59)),
                      label: Text(
                        'Kelas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.note_add_rounded, color: Colors.white),
                      selectedIcon: Icon(Icons.note_add_rounded,
                          color: Color.fromARGB(255, 6, 105, 59)),
                      label: Text(
                        'Bimbingan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                  selectedIndex: pageC.selectedIndex.value,
                  onDestinationSelected: (int i) {
                    pageC.navigation(i);
                    pageC.pageIndex(i);
                  },
                ),
              Flexible(
                child: ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                    Row(
                      children: [
                        Obx(() => CircleAvatar(
                              backgroundColor: Colors.black26,
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  "https://ui-avatars.com/api/?name=${controller.nama.value.replaceAll(' ', '-')}"),
                            )),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => Text(
                                    controller.nama.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              Obx(() => Text(
                                    controller.nim.value,
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 12,
                                    ),
                                  )),
                              Obx(() => Text(
                                    controller.departemen.value,
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 12,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(() {
                              if (controller.weather.value.location.name ==
                                  '') {
                                return CircularProgressIndicator();
                              } else {
                                return Column(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${controller.weather.value.location.name}, ${controller.weather.value.location.region}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${controller.weather.value.current.tempC}°C',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      '${controller.weather.value.current.conditionText}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                );
                              }
                            }),
                          ],
                        ),
                        Obx(() {
                          if (controller.weather.value.location.name == '') {
                            return CircularProgressIndicator();
                          } else {
                            return Image.network(
                                'https:${controller.weather.value.current.conditionIcon}');
                          }
                        }),
                      ],
                    ),
                    const SizedBox(height: 24),
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
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      width: Get.width,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4DAE7F),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Kartu Ujian",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () =>
                                      Get.toNamed(Routes.EXAM_CARD),
                                  icon: const Icon(Icons.download,
                                      color: Colors.white),
                                  label: const Text(
                                    "Cetak",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF008043),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.book,
                                      size: 40, color: Colors.white),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Jumlah Kelas",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      Obx(() => Text(
                                            controller.total_course.value,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: 2,
                                height: 40,
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.note_add_rounded,
                                      size: 40, color: Colors.white),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Total Bimbingan",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      Obx(() => Text(
                                            controller.total_counselling.value
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Daftar Kelas",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            pageC.changePage(1);
                            pageC.navigation(1);
                          },
                          child: Text("Lihat Semua"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      if (controller.courses.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final coursesToDisplay =
                          controller.courses.take(3).toList();
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: coursesToDisplay.length,
                        itemBuilder: (context, index) {
                          final course = coursesToDisplay[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black26,
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      "https://ui-avatars.com/api/?name=${course.courseName}"),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        course.courseName,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xFFCCE6D9),
                                        ),
                                        child: Text(
                                          "${course.courseCredit} SKS",
                                          style: const TextStyle(
                                              color: Color(0xFF008043)),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Riwayat Bimbingan Akademik",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            pageC.changePage(2);
                            pageC.navigation(2);
                          },
                          child: const Text("Lihat Semua"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      if (controller.counsellings.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final counselingsToDisplay =
                          controller.counsellings.take(3).toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: counselingsToDisplay.length,
                        itemBuilder: (context, index) {
                          final counseling = counselingsToDisplay[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFFFFFFFF),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.GUIDANCE_DETAILS,
                                      arguments: counseling);
                                },
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Topik: ${counseling.topicName}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        DateFormat.yMMMMEEEEd()
                                            .format(counseling.date),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: counseling.status == 0
                                              ? Color(0xFFFFE2CC)
                                              : Color(0xFFCCE6D9),
                                        ),
                                        child: Text(
                                          counseling.status == 0
                                              ? "Belum diverifikasi"
                                              : "Sudah diverifikasi",
                                          style: TextStyle(
                                            color: counseling.status == 0
                                                ? Color(0xFFFF6F00)
                                                : Color(0xFF008043),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return ConvexAppBar(
              top: -6,
              height: 56,
              style: TabStyle.react,
              backgroundColor: Colors.white,
              activeColor: Color(0xff008043),
              color: Colors.grey[400],
              items: const [
                TabItem(icon: Icons.home, title: 'Beranda'),
                TabItem(icon: Icons.class_, title: 'Kelas'),
                TabItem(icon: Icons.note_add_rounded, title: 'Bimbingan'),
              ],
              initialActiveIndex: pageC.pageIndex.value,
              onTap: (int i) {
                pageC.navigation(i);
                pageC.pageIndex(i);
              },
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
