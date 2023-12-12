import '../detail_wisata_byid_models/detail_wisata_byid_models.dart';

class CheckoutArgumentModel {
  DateTime checkinDate;
  WisataDetail wisata;

  CheckoutArgumentModel({
    required this.checkinDate,
    required this.wisata,
  });
}
