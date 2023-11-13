// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  int code;
  bool error;
  String message;
  User user;

  ProfileModel({
    required this.code,
    required this.error,
    required this.message,
    required this.user,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        code: json["code"],
        error: json["error"],
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "error": error,
        "message": message,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String name;
  String username;
  String email;
  String phoneNumber;
  String photoProfil;
  int points;
  bool isVerified;
  String categoryKesukaan;
  int categoryId;
  dynamic createdAt;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.photoProfil,
    required this.points,
    required this.isVerified,
    required this.categoryKesukaan,
    required this.categoryId,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        photoProfil: json["photo_profil"],
        points: json["points"],
        isVerified: json["is_verified"],
        categoryKesukaan: json["category_kesukaan"],
        categoryId: json["category_id"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "phone_number": phoneNumber,
        "photo_profil": photoProfil,
        "points": points,
        "is_verified": isVerified,
        "category_kesukaan": categoryKesukaan,
        "category_id": categoryId,
        "created_at": createdAt,
      };
}
