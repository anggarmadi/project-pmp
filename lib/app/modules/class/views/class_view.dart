import 'package:bimbingan_akademik/app/controllers/page_index_controller.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/class_controller.dart';

class ClassView extends GetView<ClassController> {
  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: MediaQuery.of(context).size.width < 600
          ? AppBar(
              title: const Text('List Kelas Diikuti'),
              centerTitle: true,
              backgroundColor: Color(0xFFFFFFFF),
            )
          : null,
      body: LayoutBuilder(builder: ((context, constraints) {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: Obx(() {
                if (controller.courses.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                final coursesToDisplay = controller.courses.toList();
                return constraints.maxWidth < 600
                    ? ListView.builder(
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
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 3 / 2,
                          ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                        ),
                      );
              }),
            ),
          ],
        );
      })),
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
