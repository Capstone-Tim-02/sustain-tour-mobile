class DetailPromoModel {
  int? code;
  bool? error;
  DetailPromo? promo;
  String? username;

  DetailPromoModel({
    this.code,
    this.error,
    this.promo,
    this.username,
  });

  factory DetailPromoModel.fromJson(Map<String, dynamic> json) =>
      DetailPromoModel(
        code: json["code"],
        error: json["error"],
        promo:
            json["promo"] == null ? null : DetailPromo.fromJson(json["promo"]),
        username: json["username"],
      );
}

class DetailPromo {
  int? id;
  String? title;
  String? namaPromo;
  String? kodeVoucher;
  int? jumlahPotonganPersen;
  bool? statusAktif;
  DateTime? tanggalKadaluarsa;
  String? imageVoucher;
  String? deskripsi;
  String? peraturan;
  DateTime? createdAt;

  DetailPromo({
    this.id,
    this.title,
    this.namaPromo,
    this.kodeVoucher,
    this.jumlahPotonganPersen,
    this.statusAktif,
    this.tanggalKadaluarsa,
    this.imageVoucher,
    this.deskripsi,
    this.peraturan,
    this.createdAt,
  });

  factory DetailPromo.fromJson(Map<String, dynamic> json) => DetailPromo(
        id: json["id"],
        title: json["title"],
        namaPromo: json["nama_promo"],
        kodeVoucher: json["kode_voucher"],
        jumlahPotonganPersen: json["jumlah_potongan_persen"],
        statusAktif: json["status_aktif"],
        tanggalKadaluarsa: json["tanggal_kadaluarsa"] == null
            ? null
            : DateTime.parse(json["tanggal_kadaluarsa"]),
        imageVoucher: json["image_voucher"],
        deskripsi: json["deskripsi"],
        peraturan: json["peraturan"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );
}
