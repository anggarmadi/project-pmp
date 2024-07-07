import 'package:bimbingan_akademik/app/controllers/page_index_controller.dart';
import 'package:bimbingan_akademik/app/routes/app_pages.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/guidance_controller.dart';

class GuidanceView extends GetView<GuidanceController> {
  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'id';
    initializeDateFormatting('id');

    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: MediaQuery.of(context).size.width < 600
          ? AppBar(
              title: const Text('Riwayat Bimbingan Akademik'),
              centerTitle: true,
              backgroundColor: Color(0xFFFFFFFF),
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
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
                      if (constraints.maxWidth >= 665)
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
                  extended: constraints.maxWidth >= 665,
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
              Expanded(
                child: Obx(() {
                  if (controller.counsellings.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final counselingsToDisplay = controller.counsellings.toList();
                  return constraints.maxWidth < 600
                      ? ListView.builder(
                          padding: EdgeInsets.all(10),
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
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 350,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 3 / 2,
                            ),
                            itemCount: counselingsToDisplay.length,
                            itemBuilder: (context, index) {
                              final counseling = counselingsToDisplay[index];
                              return Material(
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
                                    padding: EdgeInsets.all(10),
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
                              );
                            },
                          ),
                        );
                }),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_GUIDANCE);
        },
        child: Icon(Icons.add, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Color(0xff008043),
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
