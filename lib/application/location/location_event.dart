part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}
class GetUserLocation extends LocationEvent{
  const GetUserLocation();
}