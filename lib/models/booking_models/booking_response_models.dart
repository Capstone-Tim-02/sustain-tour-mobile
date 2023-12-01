import 'dart:convert';

class BookingResponseModel {
    int code;
    Data data;
    bool error;
    String message;

    BookingResponseModel({
        required this.code,
        required this.data,
        required this.error,
        required this.message,
    });

    factory BookingResponseModel.fromRawJson(String str) => BookingResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BookingResponseModel.fromJson(Map<String, dynamic> json) => BookingResponseModel(
        code: json["code"],
        data: Data.fromJson(json["data"]),
        error: json["error"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
        "error": error,
        "message": message,
    };
}

class Data {
    double carbonFootprint;
    DateTime checkinBooking;
    bool error;
    int hargaSebelumDiskon;
    String invoiceNumber;
    String kodeVoucher;
    String message;
    String pointMessage;
    int pointsEarned;
    int quantity;
    String statusOrder;
    DateTime tenggatPembayaran;
    int ticketId;
    int totalCost;
    int totalPotonganKodeVoucher;
    int totalPotonganPoints;
    int usedPoints;
    User user;
    Wisata wisata;

    Data({
        required this.carbonFootprint,
        required this.checkinBooking,
        required this.error,
        required this.hargaSebelumDiskon,
        required this.invoiceNumber,
        required this.kodeVoucher,
        required this.message,
        required this.pointMessage,
        required this.pointsEarned,
        required this.quantity,
        required this.statusOrder,
        required this.tenggatPembayaran,
        required this.ticketId,
        required this.totalCost,
        required this.totalPotonganKodeVoucher,
        required this.totalPotonganPoints,
        required this.usedPoints,
        required this.user,
        required this.wisata,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        carbonFootprint: json["carbon_footprint"]?.toDouble(),
        checkinBooking: DateTime.parse(json["checkin_booking"]),
        error: json["error"],
        hargaSebelumDiskon: json["harga_sebelum_diskon"],
        invoiceNumber: json["invoice_number"],
        kodeVoucher: json["kode_voucher"],
        message: json["message"],
        pointMessage: json["point_message"],
        pointsEarned: json["points_earned"],
        quantity: json["quantity"],
        statusOrder: json["status_order"],
        tenggatPembayaran: DateTime.parse(json["tenggat_pembayaran"]),
        ticketId: json["ticket_id"],
        totalCost: json["total_cost"],
        totalPotonganKodeVoucher: json["total_potongan_kode_voucher"],
        totalPotonganPoints: json["total_potongan_points"],
        usedPoints: json["used_points"],
        user: User.fromJson(json["user"]),
        wisata: Wisata.fromJson(json["wisata"]),
    );

    Map<String, dynamic> toJson() => {
        "carbon_footprint": carbonFootprint,
        "checkin_booking": "${checkinBooking.year.toString().padLeft(4, '0')}-${checkinBooking.month.toString().padLeft(2, '0')}-${checkinBooking.day.toString().padLeft(2, '0')}",
        "error": error,
        "harga_sebelum_diskon": hargaSebelumDiskon,
        "invoice_number": invoiceNumber,
        "kode_voucher": kodeVoucher,
        "message": message,
        "point_message": pointMessage,
        "points_earned": pointsEarned,
        "quantity": quantity,
        "status_order": statusOrder,
        "tenggat_pembayaran": tenggatPembayaran.toIso8601String(),
        "ticket_id": ticketId,
        "total_cost": totalCost,
        "total_potongan_kode_voucher": totalPotonganKodeVoucher,
        "total_potongan_points": totalPotonganPoints,
        "used_points": usedPoints,
        "user": user.toJson(),
        "wisata": wisata.toJson(),
    };
}

class User {
    String email;
    String name;
    String photoProfil;

    User({
        required this.email,
        required this.name,
        required this.photoProfil,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        name: json["name"],
        photoProfil: json["photo_profil"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "photo_profil": photoProfil,
    };
}

class Wisata {
    String title;

    Wisata({
        required this.title,
    });

    factory Wisata.fromRawJson(String str) => Wisata.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Wisata.fromJson(Map<String, dynamic> json) => Wisata(
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
    };
}
