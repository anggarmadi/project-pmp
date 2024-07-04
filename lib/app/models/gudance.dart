// To parse this JSON data, do
//
//     final guidance = guidanceFromJson(jsonString);

import 'dart:convert';

Guidance guidanceFromJson(String str) => Guidance.fromJson(json.decode(str));

String guidanceToJson(Guidance data) => json.encode(data.toJson());

class Guidance {
  String status;
  String message;
  int counts;
  List<Counselling> counsellings;

  Guidance({
    required this.status,
    required this.message,
    required this.counts,
    required this.counsellings,
  });

  factory Guidance.fromJson(Map<String, dynamic> json) => Guidance(
        status: json["status"],
        message: json["message"],
        counts: json["counts"],
        counsellings: List<Counselling>.from(
            json["counsellings"].map((x) => Counselling.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "counts": counts,
        "counsellings": List<dynamic>.from(counsellings.map((x) => x.toJson())),
      };
}

class Counselling {
  String id;
  String studentId;
  String counsellorId;
  String counsellingTopicId;
  String periodId;
  DateTime date;
  int status;
  String file;
  DateTime createdAt;
  DateTime updatedAt;
  List<Detail> details;
  dynamic topic;
  String topicName;

  Counselling(
      {required this.id,
      required this.studentId,
      required this.counsellorId,
      required this.counsellingTopicId,
      required this.periodId,
      required this.date,
      required this.status,
      required this.file,
      required this.createdAt,
      required this.updatedAt,
      required this.details,
      required this.topic,
      required this.topicName});

  factory Counselling.fromJson(Map<String, dynamic> json) => Counselling(
        id: json["id"],
        studentId: json["student_id"],
        counsellorId: json["counsellor_id"],
        counsellingTopicId: json["counselling_topic_id"],
        periodId: json["period_id"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
        file: json["file"] ?? "Kosong",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
        topic: json["topic"] ?? "Kosong",
        topicName: '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_id": studentId,
        "counsellor_id": counsellorId,
        "counselling_topic_id": counsellingTopicId,
        "period_id": periodId,
        "date": date.toIso8601String(),
        "status": status,
        "file": file,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
        "topic": topic,
      };
}

class Detail {
  String id;
  int no;
  String counsellingLogbookId;
  String userId;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  Detail({
    required this.id,
    required this.no,
    required this.counsellingLogbookId,
    required this.userId,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        no: json["no"],
        counsellingLogbookId: json["counselling_logbook_id"],
        userId: json["user_id"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no": no,
        "counselling_logbook_id": counsellingLogbookId,
        "user_id": userId,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
