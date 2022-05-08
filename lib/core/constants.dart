import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const kMainThemeColor=Colors.black;
const kSubThemeColor=Colors.white;

const TextStyle kHeaderTextStyle=TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.bold,
);
const kLocation= CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);