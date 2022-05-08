import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth_app/domain/location/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constants.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationService locationService;

  LocationBloc({required this.locationService})
      : super(const LocationInitial(kLocation)) {

    //to get current location of user
    on<GetUserLocation>((event, emit) async {
      final CameraPosition cameraPosition =
          await locationService.getUserLocation();
      emit(LocationUpdated(cameraPosition));
    });
  }
}
