import 'package:fpdart/fpdart.dart';
import 'package:khanakhazana/features/map/data/datasource/location_datasource.dart';
import 'package:khanakhazana/features/map/domain/entities/location_entities.dart';
import 'package:khanakhazana/features/map/domain/repository/location_repo.dart';
import 'package:khanakhazana/global/error/error_message.dart';

class LocationRepoImpl implements LocationRepository {
  final LocationDatasource locationDatasource;
  LocationRepoImpl(Object object, {required this.locationDatasource});
  @override
  Future<Either<ErrorMessage, LocationEntities>> getCurrentLocation() async {
    try {
      final location = await locationDatasource.getCurrentLocation();
      return right(location);
    } catch (e) {
      return left(ErrorMessage(e.toString()));

    }
  }
}
