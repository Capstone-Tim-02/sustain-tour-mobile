// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

// String notificationModelToJson(NotificationModel data) =>
//     json.encode(data.toJson());

class NotificationModel {
  int code;
  bool error;
  String message;
  List<Notifikasi>? notifications;

  NotificationModel({
    required this.code,
    required this.error,
    required this.message,
    required this.notifications,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        code: json["code"],
        error: json["error"],
        message: json["message"],
        notifications: json["notifications"] == null
            ? null
            : List<Notifikasi>.from(
                json["notifications"].map((x) => Notifikasi.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "code": code,
  //       "error": error,
  //       "message": message,
  //       "notifications":
  //           List<dynamic>.from(notifications.map((x) => x.toJson())),
  //     };
}

class Notifikasi {
  int id;
  String title;
  String label;
  String message;
  int? promoId;
  String status;
  bool isRead;
  int? userId;
  String? invoiceNumber;
  DateTime? createdAt;

  Notifikasi({
    required this.id,
    required this.title,
    required this.label,
    required this.message,
    this.promoId,
    required this.status,
    required this.isRead,
    this.userId,
    this.invoiceNumber,
    this.createdAt,
  });

  factory Notifikasi.fromJson(Map<String, dynamic> json) => Notifikasi(
        id: json["id"],
        title: json["title"],
        label: json["label"],
        message: json["message"],
        promoId: json["promo_id"],
        status: json["status"],
        isRead: json["is_read"],
        userId: json["user_id"],
        invoiceNumber: json["invoice_number"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "label": label,
        "message": message,
        "promo_id": promoId,
        "status": status,
        "is_read": isRead,
        "user_id": userId,
        "invoice_number": invoiceNumber,
        "created_at": createdAt?.toIso8601String(),
      };
}
