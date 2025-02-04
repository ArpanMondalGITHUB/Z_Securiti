import 'package:fpdart/fpdart.dart';
import 'package:khanakhazana/features/map/data/datasource/location_datasource.dart';
import 'package:khanakhazana/features/map/domain/entities/location_entities.dart';
import 'package:khanakhazana/features/map/domain/repositories/location_repo.dart';
import 'package:khanakhazana/global/error/error_message.dart';
import 'package:khanakhazana/global/error/exception.dart';

class LocationRepoImpl implements LocationRepository {
  final LocationDatasource locationDatasource;
  LocationRepoImpl({required this.locationDatasource});

  @override
  Future<Either<ErrorMessage, LocationEntities>> getCurrentLocation(
      {required double latitude,
      required double longitude,
      required String address}) async {
    try {
      final locationModel = await locationDatasource.getCurrentLocation(
          latitude: latitude, longitude: longitude, address: address);
      return right(locationModel);
    } on ServerException catch (e) {
      return left(ErrorMessage(e.message));
    }
  }
}
