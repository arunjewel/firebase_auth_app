import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationService{
  Future<CameraPosition> getUserLocation();
}