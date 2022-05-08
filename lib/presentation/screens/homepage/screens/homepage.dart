import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants.dart';
import '../../profile/screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller = Completer();

  late final CameraPosition _kUserLocation;

  @override
  void initState() {
    //get user location
   // getLocation();
    super.initState();
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _kUserLocation = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );
// navigate to the user location
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kUserLocation));
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: kMainThemeColor,
        title: const Text("Home"),
      ),
      // body: SafeArea(
      //   child: GoogleMap(
      //     mapType: MapType.hybrid,
      //     initialCameraPosition: kLocation,
      //     onMapCreated: (GoogleMapController controller) {
      //       _controller.complete(controller);
      //     },
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kMainThemeColor,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Profile()));
          },
          child: const Center(
            child: Icon(Icons.person),
          )),
    );
  }
}
