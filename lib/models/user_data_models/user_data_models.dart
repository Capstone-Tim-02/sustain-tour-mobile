import 'dart:convert';

class UserDataModel {
    int code;
    bool error;
    String message;
    User user;

    UserDataModel({
        required this.code,
        required this.error,
        required this.message,
        required this.user,
    });

    factory UserDataModel.fromRawJson(String str) => UserDataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
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
    DateTime? createdAt;

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

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
        createdAt: DateTime.parse(json["created_at"] ?? DateTime.now().toString()),
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
        "created_at": createdAt?.toIso8601String() ?? DateTime.now(),
    };
}
