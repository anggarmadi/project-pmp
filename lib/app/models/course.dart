// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  String status;
  String message;
  int count;
  List<CourseElement> courses;

  Course({
    required this.status,
    required this.message,
    required this.count,
    required this.courses,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        courses: List<CourseElement>.from(
            json["courses"].map((x) => CourseElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
      };
}

class CourseElement {
  String id;
  String courseName;
  int courseCredit;
  int courseSemester;
  String className;
  dynamic lecturers;
  int status;

  CourseElement({
    required this.id,
    required this.courseName,
    required this.courseCredit,
    required this.courseSemester,
    required this.className,
    required this.lecturers,
    required this.status,
  });

  factory CourseElement.fromJson(Map<String, dynamic> json) => CourseElement(
        id: json["id"],
        courseName: json["course_name"],
        courseCredit: json["course_credit"],
        courseSemester: json["course_semester"],
        className: json["class_name"],
        lecturers: json["lecturers"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_name": courseName,
        "course_credit": courseCredit,
        "course_semester": courseSemester,
        "class_name": className,
        "lecturers": lecturers,
        "status": status,
      };
}
