import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

class User {
  User({
    this.createdAt,
    this.name,
    this.avatar,
    this.id,
  });

  DateTime? createdAt;
  String? name;
  String? avatar;
  String? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        id: json["id"],
      );
}
