import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenMapsFunc {
  static Future<void> openMaps(
      {required BuildContext context, required String mapsLink}) async {
    final Uri url = Uri.parse(mapsLink);

    if (!await launchUrl(url)) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBarWidget.snackBarWidget(message: 'Gagal buka maps!'));
    }
  }
}
