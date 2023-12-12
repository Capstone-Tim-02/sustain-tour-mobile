import 'package:geolocator/geolocator.dart';

/// configurasi buat dapaetin ingpo posisi device
class GeolocatorHelper {
  static Future<bool> handleLocationPermission(
      {bool isOpenAppSettingIfDeniedForever = false}) async {
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
        return await Geolocator.openLocationSettings();
      } else {
        return false;
      }
    }

    return true;
  }
}
