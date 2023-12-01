import 'dart:convert';

class BookingRequestBodyModel {
    int wisataId;
    bool useAllPoints;
    String kodeVoucher;
    int quantity;
    String checkinBooking;

    BookingRequestBodyModel({
        required this.wisataId,
        required this.useAllPoints,
        required this.kodeVoucher,
        required this.quantity,
        required this.checkinBooking,
    });

    String toRawJson() => json.encode(toJson());

    Map<String, dynamic> toJson() => {
        "wisata_id": wisataId,
        "use_all_points": useAllPoints,
        "kode_voucher": kodeVoucher,
        "quantity": quantity,
        "checkin_booking": checkinBooking,
    };
}
