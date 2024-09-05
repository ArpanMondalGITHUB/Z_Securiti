import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:khanakhazana/features/map/domain/usecases/get_current_location_usecase.dart';

part 'current_location_event.dart';
part 'current_location_state.dart';

class CurrentLocationBloc
    extends Bloc<CurrentLocationEvent, CurrentLocationState> {
  final GetCurrentLocation getLocation;
  CurrentLocationBloc(this.getLocation,) : super(CurrentLocationInitial()) {
    on<CurrentLocationEvent>((event, emit) async {
      emit(CurrentLocationLoading());
      try {
        final location = await getLocation();
        emit(CurrentLocationLoaded(location as Location));
      } catch (e) {
        emit(CurrenLocationLoadingFailed(e.toString()));
      }
    });
  }
}
