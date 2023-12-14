import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/alert_dialog_component/alert_dialog_component.dart';

/// configurasi buat dapaetin ingpo posisi device
class GeolocatorHelper {
  static Future<bool> handleLocationPermission(
      {bool isOpenAppSettingIfDeniedForever = false, BuildContext? context}) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (isOpenAppSettingIfDeniedForever) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context!,
          builder: (context) {
            return AlertDialogComponent(
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              contentPadding: const EdgeInsets.only(
                  left: 24, right: 24, top: 42, bottom: 32),
              text:
                  'Mohon aktifkan perizinan lokasi di setting!',
              labelBlueButton : "Buka",
              labelRedButton: "Batal",
              reverseButtonPosition: true,
              onPressedNoButton: () => Navigator.pop(context),
              onPressedYesButton: () async {
                Navigator.pop(context);
                await Geolocator.openLocationSettings();
              },
            );
          });
        return false;
      } else {
        return false;
      }
    }

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      return true;
    }

    return false;
  }
}
