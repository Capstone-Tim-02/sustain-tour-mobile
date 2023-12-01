import 'package:intl/intl.dart';

class DateFormatConst {
  static DateFormat dateToTanggalBulanTahunFormat = DateFormat(
    "d MMMM yyyy",
  );

  static DateFormat dateToTanggalHalfBulanTahunFormat = DateFormat(
    "dd MMM, yyyy",
  );

  static DateFormat dateToTanggalHalfBulanTahunFormatNoKoma = DateFormat(
    "dd MMM yyyy",
  );
}
