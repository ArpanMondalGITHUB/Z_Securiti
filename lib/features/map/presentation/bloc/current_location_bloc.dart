import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:khanakhazana/features/map/domain/entities/location_entities.dart';
import 'package:khanakhazana/features/map/domain/usecases/get_current_location_usecase.dart';

part 'current_location_event.dart';
part 'current_location_state.dart';

class CurrentLocationBloc
    extends Bloc<CurrentLocationEvent, CurrentLocationState> {
  final GetCurrentLocation getLocation;
  CurrentLocationBloc(this.getLocation) : super(CurrentLocationInitial()) {
    on<FetchCurrentLocation>((event, emit) async {
      emit(CurrentLocationLoading());
      try {
        final result = await getLocation();
        result.fold(
            (error) => emit(CurrenLocationLoadingFailed(error.meassage)),
            (location) => emit(CurrentLocationLoaded(location)));
      } catch (e) {
        emit(CurrenLocationLoadingFailed(
            'Failed to fetch location: ${e.toString()}'));
      }
    });
  }
}
