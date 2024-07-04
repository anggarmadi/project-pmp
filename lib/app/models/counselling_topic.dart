class CounsellingTopic {
  final String id;
  final String name;

  CounsellingTopic({
    required this.id,
    required this.name,
  });

  factory CounsellingTopic.fromJson(Map<String, dynamic> json) {
    return CounsellingTopic(
      id: json['id'],
      name: json['name'],
    );
  }
}
