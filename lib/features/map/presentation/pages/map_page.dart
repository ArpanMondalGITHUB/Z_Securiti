import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:khanakhazana/features/map/presentation/pages/user_location_page.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        zoomControlsEnabled: false,
        onMapCreated: (controller) {
          _controller = controller;
        },
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: LatLng(20.593684, 78.96288),
          zoom: 4.00,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserLocationPage(),
              ));
        },
        child: const Icon(
          Icons.location_on,
        ),
      ),
    );
  }
}
