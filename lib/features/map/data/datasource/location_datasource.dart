import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:khanakhazana/features/map/data/models/location_model.dart';
import 'package:khanakhazana/global/error/exception.dart';

abstract class LocationDatasource {
  Future<LocationModel> getCurrentLocation();
}

class LocationDatasourceImpl implements LocationDatasource {
  @override
  Future<LocationModel> getCurrentLocation() async {
    try {
      bool permissionGranted = await _managePermission();
      if (!permissionGranted) {
        throw const ServerException('Permission not granted');
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude,position.longitude,);
      Placemark place = placemarks[0];
      String address = "${place.street}, ${place.locality}, ${place.country} , ";

      return LocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
        address:address,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<bool> _managePermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return false;
      }
    }
    return true;
  }
}
