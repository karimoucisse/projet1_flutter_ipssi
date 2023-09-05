import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyDataMaps extends StatefulWidget {
  Position coordonnee;
  MyDataMaps({required this.coordonnee,super.key});

  @override
  State<MyDataMaps> createState() => _MyDataMapsState();
}

class _MyDataMapsState extends State<MyDataMaps> {
  //variable
  Completer<GoogleMapController> completer = Completer();
  late CameraPosition camera;


  @override
  void initState() {
    // TODO: implement initState
    camera = CameraPosition(target: LatLng(widget.coordonnee.latitude,widget.coordonnee.longitude),zoom: 14);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: camera,
      onMapCreated: (mapsController){
          completer.complete(mapsController);
      },
    );
  }
}
