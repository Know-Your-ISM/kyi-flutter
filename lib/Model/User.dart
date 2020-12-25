// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.count,
    this.students,
    this.queryTime,
  });

  int count;
  List<Student> students;
  int queryTime;

  factory User.fromJson(Map<String, dynamic> json) => User(
    count: json["count"] == null ? null : json["count"],
    students: json["students"] == null ? null : List<Student>.from(json["students"].map((x) => Student.fromJson(x))),
    queryTime: json["_queryTime"] == null ? null : json["_queryTime"],
  );

  Map<String, dynamic> toJson() => {
    "count": count == null ? null : count,
    "students": students == null ? null : List<dynamic>.from(students.map((x) => x.toJson())),
    "_queryTime": queryTime == null ? null : queryTime,
  };
}

class Student {
  Student({
    this.sex,
    this.house,
    this.city,
    this.state,
    this.course,
    this.department,
    this.clubs,
    this.facebook,
    this.special,
    this.id,
    this.admissionNo,
    this.name,
    this.createdAt,
    this.admno,
    this.avatarUrl,
  });

  String sex;
  String house;
  String city;
  String state;
  String course;
  String department;
  List<String> clubs;
  String facebook;
  String special;
  String id;
  String admissionNo;
  String name;
  DateTime createdAt;
  String admno;
  String avatarUrl;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    sex: json["Sex"] == null ? null : json["Sex"],
    house: json["House"] == null ? null : json["House"],
    city: json["City"] == null ? null : json["City"],
    state: json["State"] == null ? null : json["State"],
    course: json["Course"] == null ? null : json["Course"],
    department: json["Department"] == null ? null : json["Department"],
    clubs: json["Clubs"] == null ? null : List<String>.from(json["Clubs"].map((x) => x)),
    facebook: json["Facebook"] == null ? null : json["Facebook"],
    special: json["Special"] == null ? null : json["Special"],
    id: json["_id"] == null ? null : json["_id"],
    admissionNo: json["Admission No"] == null ? null : json["Admission No"],
    name: json["Name"] == null ? null : json["Name"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    admno: json["admno"] == null ? null : json["admno"],
    avatarUrl: json["avatarURL"] == null ? null : json["avatarURL"],
  );

  Map<String, dynamic> toJson() => {
    "Sex": sex == null ? null : sex,
    "House": house == null ? null : house,
    "City": city == null ? null : city,
    "State": state == null ? null : state,
    "Course": course == null ? null : course,
    "Department": department == null ? null : department,
    "Clubs": clubs == null ? null : List<dynamic>.from(clubs.map((x) => x)),
    "Facebook": facebook == null ? null : facebook,
    "Special": special == null ? null : special,
    "_id": id == null ? null : id,
    "Admission No": admissionNo == null ? null : admissionNo,
    "Name": name == null ? null : name,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "admno": admno == null ? null : admno,
    "avatarURL": avatarUrl == null ? null : avatarUrl,
  };
}
