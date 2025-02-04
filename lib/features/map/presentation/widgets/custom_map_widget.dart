import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMapWidget extends StatelessWidget {
  final String? infoWindow;
  final String? markerId;
  final double latitude;
  final double longitude;
  const CustomMapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.markerId,
    required this.infoWindow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(10.0),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId(markerId ?? 'default-marker'),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(
              title: infoWindow ?? 'Location',
            ),
          ),
        },
      ),
    );
  }
}
