part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {
  final CameraPosition cameraPosition;

  const LocationInitial(this.cameraPosition);
}

class LocationUpdated extends LocationState {
  final CameraPosition cameraPosition;

  const LocationUpdated(this.cameraPosition);
}
