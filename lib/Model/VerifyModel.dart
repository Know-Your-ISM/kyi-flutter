// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

ModelUser modelUserFromJson(String str) => ModelUser.fromJson(json.decode(str));

String modelUserToJson(ModelUser data) => json.encode(data.toJson());

class ModelUser {
  ModelUser({
    this.student,
    this.status,
  });
  String status;
  Student student;

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
    student: json["student"]==null?null:Student.fromJson(json["student"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "student": student==null?null:student.toJson(),
  };
}

class Student {
  Student({
    this.name,
    this.id,
  });

  String name;
  String id;

  factory Student.fromJson(Map<String, dynamic> json) => Student(

    name: json["Name"] == null ? null : json["Name"],
    id: json["_id"] == null ? null : json["_id"],

  );

  Map<String, dynamic> toJson() => {
    "Name": name == null ? null : name,
    "_id": id == null ? null : id,
  };
}
