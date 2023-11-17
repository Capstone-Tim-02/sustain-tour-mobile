// To parse this JSON data, do
//
//     final bookingHistoryModel = bookingHistoryModelFromJson(jsonString);

import 'dart:convert';

BookingHistoryModel bookingHistoryModelFromJson(String str) =>
    BookingHistoryModel.fromJson(json.decode(str));

String bookingHistoryModelToJson(BookingHistoryModel data) =>
    json.encode(data.toJson());

class BookingHistoryModel {
  int code;
  bool error;
  String message;
  List<TicketData> ticketData;

  BookingHistoryModel({
    required this.code,
    required this.error,
    required this.message,
    required this.ticketData,
  });

  factory BookingHistoryModel.fromJson(Map<String, dynamic> json) =>
      BookingHistoryModel(
        code: json["code"],
        error: json["error"],
        message: json["message"],
        ticketData: List<TicketData>.from(
            json["ticket_data"].map((x) => TicketData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "error": error,
        "message": message,
        "ticket_data": List<dynamic>.from(ticketData.map((x) => x.toJson())),
      };
}

class TicketData {
  double carboonFootprint;
  DateTime checkinBooking;
  String invoiceNumber;
  String kodeVoucher;
  String kotaWisata;
  String lokasiWisata;
  bool paid;
  String photoWisata1;
  String photoWisata2;
  String photoWisata3;
  int pointsEarned;
  int pointsUsed;
  int quantity;
  String statusOrder;
  DateTime? tenggatPembayaran;
  int ticketId;
  int totalCost;
  int userId;
  int wisataId;
  String wisataName;

  TicketData({
    required this.carboonFootprint,
    required this.checkinBooking,
    required this.invoiceNumber,
    required this.kodeVoucher,
    required this.kotaWisata,
    required this.lokasiWisata,
    required this.paid,
    required this.photoWisata1,
    required this.photoWisata2,
    required this.photoWisata3,
    required this.pointsEarned,
    required this.pointsUsed,
    required this.quantity,
    required this.statusOrder,
    required this.tenggatPembayaran,
    required this.ticketId,
    required this.totalCost,
    required this.userId,
    required this.wisataId,
    required this.wisataName,
  });

  factory TicketData.fromJson(Map<String, dynamic> json) => TicketData(
        carboonFootprint: json["carboon_footprint"]?.toDouble(),
        checkinBooking: DateTime.parse(json["checkin_booking"]),
        invoiceNumber: json["invoice_number"],
        kodeVoucher: json["kode_voucher"],
        kotaWisata: json["kota_wisata"],
        lokasiWisata: json["lokasi_wisata"],
        paid: json["paid"],
        photoWisata1: json["photo_wisata1"],
        photoWisata2: json["photo_wisata2"],
        photoWisata3: json["photo_wisata3"],
        pointsEarned: json["points_earned"],
        pointsUsed: json["points_used"],
        quantity: json["quantity"],
        statusOrder: json["status_order"],
        tenggatPembayaran: json["tenggat_pembayaran"] == null
            ? null
            : DateTime.parse(json["tenggat_pembayaran"]),
        ticketId: json["ticket_id"],
        totalCost: json["total_cost"],
        userId: json["user_id"],
        wisataId: json["wisata_id"],
        wisataName: json["wisata_name"],
      );

  Map<String, dynamic> toJson() => {
        "carboon_footprint": carboonFootprint,
        "checkin_booking": checkinBooking.toIso8601String(),
        "invoice_number": invoiceNumber,
        "kode_voucher": kodeVoucher,
        "kota_wisata": kotaWisata,
        "lokasi_wisata": lokasiWisata,
        "paid": paid,
        "photo_wisata1": photoWisata1,
        "photo_wisata2": photoWisata2,
        "photo_wisata3": photoWisata3,
        "points_earned": pointsEarned,
        "points_used": pointsUsed,
        "quantity": quantity,
        "status_order": statusOrder,
        "tenggat_pembayaran": tenggatPembayaran?.toIso8601String(),
        "ticket_id": ticketId,
        "total_cost": totalCost,
        "user_id": userId,
        "wisata_id": wisataId,
        "wisata_name": wisataName,
      };
}
