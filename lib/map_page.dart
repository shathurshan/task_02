import 'dart:async';

import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  final String lati;
  final String longi;
  const MapPage(this.lati, this.longi);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // final Completer<GoogleMapController> _controller = Completer();

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   // controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }

  @override
  Widget build(BuildContext context) {
    // CameraPosition _kGooglePlex = CameraPosition(
    //   target: LatLng(
    //     widget.lati,
    //     -widget.longi,
    //   ),
    //   zoom: 14.4746,
    // );

    // final CameraPosition _kLake = CameraPosition(
    //     bearing: 192.8334901395799,
    //     target: LatLng(37.43296265331129, -122.08832357078792),
    //     tilt: 59.440717697143555,
    //     zoom: 19.151926040649414);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
        centerTitle: true,
      ),
      // body: GoogleMap(
      //   mapType: MapType.hybrid,
      //   initialCameraPosition: _kGooglePlex,
      //   onMapCreated: (GoogleMapController controller) {
      //     _controller.complete(controller);
      //   },
      // ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
      body: Center(
        child: Text(
          "${widget.lati}and${widget.longi}",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
