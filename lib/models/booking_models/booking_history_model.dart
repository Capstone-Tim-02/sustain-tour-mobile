// To parse this JSON data, do
//
//     final bookingHistoryModel = bookingHistoryModelFromJson(jsonString);

import 'dart:convert';

BookingHistoryModel bookingHistoryModelFromJson(String str) =>
    BookingHistoryModel.fromJson(json.decode(str));

// String bookingHistoryModelToJson(BookingHistoryModel data) =>
//     json.encode(data.toJson());

class BookingHistoryModel {
  int code;
  bool error;
  String message;
  List<TicketData>? ticketData;

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

  // Map<String, dynamic> toJson() => {
  //       "code": code,
  //       "error": error,
  //       "message": message,
  //       "ticket_data": List<dynamic>.from(ticketData.map((x) => x.toJson())),
  //     };
}

class TicketData {
  double carboonFootprint;
  DateTime checkinBooking;
  String email;
  int hargaSebelumDiskon;
  String invoiceNumber;
  String kodeVoucher;
  String kotaWisata;
  double lat;
  String lokasiWisata;
  double long;
  String mapsLink;
  bool paid;
  String photoWisata1;
  String photoWisata2;
  String photoWisata3;
  int pointsEarned;
  int quantity;
  String statusOrder;
  DateTime? tenggatPembayaran;
  int ticketId;
  int totalCost;
  int totalPotonganKodeVoucher;
  int totalPotonganPoints;
  int userId;
  String username;
  int wisataId;
  String wisataName;

  TicketData({
    required this.carboonFootprint,
    required this.checkinBooking,
    required this.email,
    required this.hargaSebelumDiskon,
    required this.invoiceNumber,
    required this.kodeVoucher,
    required this.kotaWisata,
    required this.lat,
    required this.lokasiWisata,
    required this.long,
    required this.mapsLink,
    required this.paid,
    required this.photoWisata1,
    required this.photoWisata2,
    required this.photoWisata3,
    required this.pointsEarned,
    required this.quantity,
    required this.statusOrder,
    required this.tenggatPembayaran,
    required this.ticketId,
    required this.totalCost,
    required this.totalPotonganKodeVoucher,
    required this.totalPotonganPoints,
    required this.userId,
    required this.username,
    required this.wisataId,
    required this.wisataName,
  });

  factory TicketData.fromJson(Map<String, dynamic> json) => TicketData(
        carboonFootprint: json["carboon_footprint"]?.toDouble(),
        checkinBooking: DateTime.parse(json["checkin_booking"]),
        email: json["email"],
        hargaSebelumDiskon: json["harga_sebelum_diskon"],
        invoiceNumber: json["invoice_number"],
        kodeVoucher: json["kode_voucher"],
        kotaWisata: json["kota_wisata"],
        lat: json["lat"]?.toDouble(),
        lokasiWisata: json["lokasi_wisata"],
        long: json["long"]?.toDouble(),
        mapsLink: json["maps_link"],
        paid: json["paid"],
        photoWisata1: json["photo_wisata1"],
        photoWisata2: json["photo_wisata2"],
        photoWisata3: json["photo_wisata3"],
        pointsEarned: json["points_earned"],
        quantity: json["quantity"],
        statusOrder: json["status_order"],
        tenggatPembayaran: json["tenggat_pembayaran"] == null
            ? null
            : DateTime.parse(json["tenggat_pembayaran"]),
        ticketId: json["ticket_id"],
        totalCost: json["total_cost"],
        totalPotonganKodeVoucher: json["total_potongan_kode_voucher"],
        totalPotonganPoints: json["total_potongan_points"],
        userId: json["user_id"],
        username: json["username"],
        wisataId: json["wisata_id"],
        wisataName: json["wisata_name"],
      );

  Map<String, dynamic> toJson() => {
        "carboon_footprint": carboonFootprint,
        "checkin_booking": checkinBooking.toIso8601String(),
        "email": email,
        "harga_sebelum_diskon": hargaSebelumDiskon,
        "invoice_number": invoiceNumber,
        "kode_voucher": kodeVoucher,
        "kota_wisata": kotaWisata,
        "lat": lat,
        "lokasi_wisata": lokasiWisata,
        "long": long,
        "maps_link": mapsLink,
        "paid": paid,
        "photo_wisata1": photoWisata1,
        "photo_wisata2": photoWisata2,
        "photo_wisata3": photoWisata3,
        "points_earned": pointsEarned,
        "quantity": quantity,
        "status_order": statusOrder,
        "tenggat_pembayaran": tenggatPembayaran?.toIso8601String(),
        "ticket_id": ticketId,
        "total_cost": totalCost,
        "total_potongan_kode_voucher": totalPotonganKodeVoucher,
        "total_potongan_points": totalPotonganPoints,
        "user_id": userId,
        "username": username,
        "wisata_id": wisataId,
        "wisata_name": wisataName,
      };
}
