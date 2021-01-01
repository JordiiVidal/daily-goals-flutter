import 'dart:convert';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

enum Exigency { Low, Medium, High }

class Activity {
  Activity({
    String id,
    Exigency exigency,
    this.name,
  })  : this.id = id ?? DateTime.now().toString(),
        this.exigency = exigency ?? Exigency.Medium;

  String id;
  String name;
  Exigency exigency;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        exigency: json["exigency"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "exigency": exigency,
      };
  String get exigencyValue => this.exigency.toString().split('.').last;
}
