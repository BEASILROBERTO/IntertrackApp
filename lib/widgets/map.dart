// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class InterMap extends StatefulWidget {
  const InterMap({
    Key? key,
  }) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<InterMap> {
  // Setting up MAP
  final String apiKey = "E5W2G5zaKeyf8sGShKMGTaUiYABLKNgp";
  final tomtomHQ = LatLng(25.726232, -100.311603);
  final tomtomZoom = 18.0;

  @override
  Widget build(BuildContext context) {
    // Get screen's width and height.
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: <Widget>[
          FlutterMap(
            options: MapOptions(
              initialCenter: tomtomHQ,
              initialZoom: tomtomZoom,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
                    "{z}/{x}/{y}.png?key={apiKey}",
                additionalOptions: {"apiKey": apiKey},
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: tomtomHQ,
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
