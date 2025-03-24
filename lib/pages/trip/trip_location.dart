import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripLocation extends StatelessWidget {
  TripLocation({super.key, required this.location});

  final List<double> location;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      buildingsEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(location[0], location[1]),
        zoom: 14.4746,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
