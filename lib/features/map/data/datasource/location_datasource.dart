import 'package:geocoder2/geocoder2.dart';
import 'package:khanakhazana/features/map/data/models/location_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:khanakhazana/global/error/exception.dart';

abstract interface class LocationDatasource {
  Future<LocationModel> getCurrentLocation(
      {required double latitude,
      required double longitude,
      required String address});
}

class LocationDatasourceImpl implements LocationDatasource {
  late final Geocoder2 geocoder2;
  late LocationPermission permission;

  @override
  Future<LocationModel> getCurrentLocation(
      {required double latitude,
      required double longitude,
      required String address}) async {
    try {
      // Get current position
      final position = await _determinePosition();

      try {
        print(
            'Attempting geocoding for: ${position.latitude}, ${position.longitude}');
        final location = await Geocoder2.getDataFromCoordinates(
          latitude: position.latitude,
          longitude: position.longitude,
          googleMapApiKey: "YOUR_API_KEY",
          language: "en",
        );
        print('Geocoding successful: ${location.address}');

        return LocationModel(
          latitude: position.latitude,
          longitude: position.longitude,
          address: location.address,
        );
      } catch (geocoderError) {
        print('Geocoding failed with error: $geocoderError');
        // If geocoding fails, return location with default address
        return LocationModel(
          latitude: position.latitude,
          longitude: position.longitude,
          address: 'Location found (Address unavailable)',
        );
      }
    } catch (e) {
      if (e is ServerException) {
        print('Server Exception: ${e.message}');
        rethrow;
      }
      print('Original Error: ${e.toString()}');
      throw ServerException('Failed to get location data: ${e.toString()}');
    }
  }

  // Helper method to get current position
  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const ServerException(
          'Please enable location services in your device settings to continue.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const ServerException(
            'Location permissions are required to use this feature.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw const ServerException(
          'Location permissions are permanently denied. Please enable them in your device settings.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
