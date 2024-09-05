import 'package:fpdart/fpdart.dart';
import 'package:khanakhazana/features/map/domain/entities/location_entities.dart';
import 'package:khanakhazana/global/error/error_message.dart';

abstract class LocationRepository {
  Future<Either<ErrorMessage, LocationEntities>> getCurrentLocation();
  
}
