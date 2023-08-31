import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(38.198309337524535, 67.2032178612671),
        zoom: 12,
        interactiveFlags: InteractiveFlag.all,
        maxZoom: 16,
        minZoom: 9,
        absorbPanEventsOnScrollables: true,
        adaptiveBoundaries: false,

      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
      ],
    );
  }
}
