import 'package:fpdart/fpdart.dart';
import 'package:khanakhazana/features/map/domain/entities/location_entities.dart';
import 'package:khanakhazana/features/map/domain/repositories/location_repo.dart';
import 'package:khanakhazana/global/error/error_message.dart';
// import 'package:khanakhazana/global/usecase/usecase.dart';

class GetCurrentLocation {
  final LocationRepository repository;

  GetCurrentLocation(this.repository);

  Future<Either<ErrorMessage, LocationEntities>> call() async {
    return repository.getCurrentLocation(
      latitude: 0.0,
      longitude: 0.0,
      address: '',
    );
  }
}
