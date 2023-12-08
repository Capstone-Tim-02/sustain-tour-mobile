import 'package:intl/intl.dart';

class DateFormatConst {
  static DateFormat dateToTanggalBulanTahunFormat = DateFormat(
    "d MMMM yyyy",
    'ID_id'
  );

  static DateFormat dateToTanggalHalfBulanTahunFormat = DateFormat(
    "dd MMM, yyyy",
    'ID_id'
  );

  static DateFormat dateToTanggalHalfBulanTahunFormatNoKoma = DateFormat(
    "dd MMM yyyy",
    'ID_id'
  );

  static DateFormat dateToTanggalHalfBulanFormat = DateFormat(
    "d MMM",
    'ID_id'
  );
}
