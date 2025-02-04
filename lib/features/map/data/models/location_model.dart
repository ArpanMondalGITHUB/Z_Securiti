import 'package:khanakhazana/features/map/domain/entities/location_entities.dart';

class LocationModel extends LocationEntities {
  LocationModel(
      {required super.longitude,
      required super.address,
      required super.latitude,});

  factory LocationModel.fromgeoCoder2(Map<String, dynamic> fromgeoCoder2) {
    return LocationModel(
        longitude: fromgeoCoder2['longitude'],
        address: fromgeoCoder2['adress'],
        latitude: fromgeoCoder2['latitude'],);
  }
}
