import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double latTarget;
  final double longTarget;
  final double? zoom;
  final MapType mapType;
  const GoogleMapsWidget(
      {super.key,
      this.height,
      this.width,
      required this.latTarget,
      required this.longTarget,
      this.zoom,
      this.mapType = MapType.normal});

  @override
  Widget build(BuildContext context) {
    final CameraPosition lokasiWisata = CameraPosition(
      target: LatLng(
        latTarget,
        longTarget,
      ),
      zoom: zoom ?? 15,
    );
    return SizedBox(
      height: height ?? 116,
      width: width ?? double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GoogleMap(
          initialCameraPosition: lokasiWisata,
          mapType: mapType,
          zoomControlsEnabled: false,
          trafficEnabled: true,
          gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer(),
            ),
          },
          markers: {
            Marker(
              markerId: const MarkerId('TempatWisata'),
              position: LatLng(
                latTarget,
                longTarget,
              ),
            ),
          },
        ),
      ),
    );
  }
}
