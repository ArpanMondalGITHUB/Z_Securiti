import 'package:khanakhazana/features/map/domain/entities/location_entities.dart';

class LocationModel extends LocationEntities {
  LocationModel(
      {required super.longitude,
      required super.address,
      required super.latitude,});

  factory LocationModel.fromGeolocation(Map<String, dynamic> fromgeolocator) {
    return LocationModel(
        longitude: fromgeolocator['longitude'],
        address: fromgeolocator['adress'],
        latitude: fromgeolocator['latitude'],);
  }
}
