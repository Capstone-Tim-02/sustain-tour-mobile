import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';

class CheckoutArgumentModel {
  DateTime checkinDate;
  Wisata wisata;

  CheckoutArgumentModel({
    required this.checkinDate,
    required this.wisata,
  });
}