import 'package:geolocator/geolocator.dart';
import 'package:khanakhazana/global/error/exception.dart';

class LocationServices {
   Future<LocationPermission> checkPermission() async {
    return await GeolocatorPlatform.instance.checkPermission();
  }

   Future<LocationPermission> requestPermission() async {
    return await GeolocatorPlatform.instance.requestPermission();
  }

   Future<bool> managePermission() async {
    LocationPermission permission = await checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await requestPermission();
    }
    if (permission == LocationPermission.denied) {
      return false;
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    } else {
      return true;
    }
  }

  Future<Position> getLastKnownPosition() async {
    bool permissionGranted = await managePermission();
    if (!permissionGranted) {
      throw const ServerException('permission not granted');
    }
    Position? lastKnownPOsition = await Geolocator.getLastKnownPosition();
    if (lastKnownPOsition != null) {
      return lastKnownPOsition;
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<Position> updateCameraPosition() async {
     bool permissiongranted = await managePermission();
    if (!permissiongranted) {
      throw const ServerException('permission not granted');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}





