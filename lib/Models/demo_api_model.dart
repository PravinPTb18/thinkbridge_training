import 'dart:convert';

List<DemoApiModel> demoApiModelFromJson(String str) => List<DemoApiModel>.from(
    json.decode(str).map((x) => DemoApiModel.fromJson(x)));

String demoApiModelToJson(List<DemoApiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DemoApiModel {
  DemoApiModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory DemoApiModel.fromJson(Map<String, dynamic> json) => DemoApiModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
