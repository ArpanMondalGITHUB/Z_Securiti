part of 'current_location_bloc.dart';

sealed class CurrentLocationState extends Equatable {
  const CurrentLocationState();

  @override
  List<Object> get props => [];
}

final class CurrentLocationInitial extends CurrentLocationState {}

class CurrentLocationLoading extends CurrentLocationState {}

class CurrentLocationLoaded extends CurrentLocationState {
  final Location location;

 const CurrentLocationLoaded(this.location);
}

class CurrenLocationLoadingFailed extends CurrentLocationState {
  final String message;

 const CurrenLocationLoadingFailed(this.message);

}
