import 'package:fpdart/fpdart.dart';
import 'package:khanakhazana/features/map/domain/entities/location_entities.dart';
import 'package:khanakhazana/global/error/error_message.dart';

abstract interface class LocationRepository {
  Future<Either<ErrorMessage, LocationEntities>> getCurrentLocation({
    required double latitude,
    required double longitude,
    required String address
  });
}