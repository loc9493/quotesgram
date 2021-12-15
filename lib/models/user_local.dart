import 'dart:convert';

UserLocal userLocalFromJson(String str) => UserLocal.fromJson(json.decode(str));

String userLocalToJson(UserLocal data) => json.encode(data.toJson());

class UserLocal {
  UserLocal({
    this.name,
    this.email,
    this.uid,
  });

  String? name;
  String? email;
  String? uid;

  factory UserLocal.fromJson(Map<String, dynamic> json) => UserLocal(
        name: json["name"],
        email: json["email"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "uid": uid,
      };
}
