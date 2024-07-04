// To parse this JSON data, do
//
//     final exam = examFromJson(jsonString);

import 'dart:convert';

Exam examFromJson(String str) => Exam.fromJson(json.decode(str));

String examToJson(Exam data) => json.encode(data.toJson());

class Exam {
  String status;
  String message;
  ExamCard examCard;

  Exam({
    required this.status,
    required this.message,
    required this.examCard,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        status: json["status"],
        message: json["message"],
        examCard: ExamCard.fromJson(json["exam_card"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "exam_card": examCard.toJson(),
      };
}

class ExamCard {
  String studentId;
  String name;
  String nim;
  int year;
  String department;
  dynamic photo;
  String passcode;

  ExamCard({
    required this.studentId,
    required this.name,
    required this.nim,
    required this.year,
    required this.department,
    required this.photo,
    required this.passcode,
  });

  factory ExamCard.fromJson(Map<String, dynamic> json) => ExamCard(
        studentId: json["student_id"],
        name: json["name"],
        nim: json["nim"],
        year: json["year"],
        department: json["department"],
        photo: json["photo"],
        passcode: json["passcode"],
      );

  Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "name": name,
        "nim": nim,
        "year": year,
        "department": department,
        "photo": photo,
        "passcode": passcode,
      };
}
