part of 'current_location_bloc.dart';

sealed class CurrentLocationEvent extends Equatable {
  const CurrentLocationEvent();

  @override
  List<Object> get props => [];
}

class FetchCurrentLocation extends CurrentLocationEvent {}
