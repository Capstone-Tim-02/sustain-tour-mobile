import 'dart:convert';

class PromoModel {
    int code;
    bool error;
    List<Promo> promos;
    String username;

    PromoModel({
        required this.code,
        required this.error,
        required this.promos,
        required this.username,
    });

    factory PromoModel.fromRawJson(String str) => PromoModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PromoModel.fromJson(Map<String, dynamic> json) => PromoModel(
        code: json["code"],
        error: json["error"],
        promos: List<Promo>.from(json["promos"].map((x) => Promo.fromJson(x))),
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "error": error,
        "promos": List<dynamic>.from(promos.map((x) => x.toJson())),
        "username": username,
    };
}

class Promo {
    int id;
    String title;
    String namaPromo;
    String kodeVoucher;
    int jumlahPotonganPersen;
    bool statusAktif;
    DateTime tanggalKadaluarsa;
    String imageVoucher;

    Promo({
        required this.id,
        required this.title,
        required this.namaPromo,
        required this.kodeVoucher,
        required this.jumlahPotonganPersen,
        required this.statusAktif,
        required this.tanggalKadaluarsa,
        required this.imageVoucher,
    });

    factory Promo.fromRawJson(String str) => Promo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Promo.fromJson(Map<String, dynamic> json) => Promo(
        id: json["id"],
        title: json["title"],
        namaPromo: json["nama_promo"],
        kodeVoucher: json["kode_voucher"],
        jumlahPotonganPersen: json["jumlah_potongan_persen"],
        statusAktif: json["status_aktif"],
        tanggalKadaluarsa: DateTime.parse(json["tanggal_kadaluarsa"]),
        imageVoucher: json["image_voucher"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "nama_promo": namaPromo,
        "kode_voucher": kodeVoucher,
        "jumlah_potongan_persen": jumlahPotonganPersen,
        "status_aktif": statusAktif,
        "tanggal_kadaluarsa": tanggalKadaluarsa.toIso8601String(),
        "image_voucher": imageVoucher,
    };
}
