import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class Hotels extends StatefulWidget {
  const Hotels({Key? key}) : super(key: key);

  @override
  State<Hotels> createState() => _HotelsState();
}

List<String> hotelsName = [
  'Hotel Boysun',
  'Hotel Firdavs',
  'Hotel Grand',
  'Hotel Normat',
  'Hotel Sahara',
  'Hotel Shursoy',
  'Hotel Gaza',
  'Qosimov hotel',
  'Hotel Omonxona',
  'Pulhokim Plaza'
];
List<String> hotelsPhone = [
  '+998909073494',
  '+998915839747',
  '+998909533506',
  '+998905683324',
  '+998997940524',
  '+998995999999',
  '+998909124666',
  '',
  '+998978098778',
  '+998912280201',
];
List<LatLng> hotelsCoordinate = [
  LatLng(38.19888715077968, 67.2085222550796), //boysun
  LatLng(38.201963926024106, 67.20657761537704), //firdavs
  LatLng(38.20470126988821, 67.20453359482099), //grand
  LatLng(38.207708890427334, 67.20656883099288), //normat
  LatLng(38.1830361981217, 67.21059292916964), //sahara
  LatLng(38.19559355710855, 67.22581376495525), //shursoy
  LatLng(38.20388352162822, 67.22571067102642), //gaza
  LatLng(38.235611974632064, 67.31680840668491), //kasimov
  LatLng(38.2328477991379, 67.31974810762733), //omonxona
  LatLng(38.23546028479926, 67.31828898599167), //pulhokim
];
List<String> hotelsImage = [
  'assets/images/hotels/boysun.png',
  'assets/images/hotels/firdavs.png',
  'assets/images/hotels/grand.png',
  'assets/images/hotels/normat.png',
  'assets/images/hotels/sahara.png',
  'assets/images/hotels/shursoy.png',
  'assets/images/hotels/gaza.png',
  'assets/images/hotels/kasimov.png',
  'assets/images/hotels/omonxona.png',
  'assets/images/hotels/pulhokim.png',
];

class _HotelsState extends State<Hotels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
            'hotels'.tr,
            style: const TextStyle(color: Colors.black),
          )),
          backgroundColor: Colors.white),
      body: ListView.builder(
        itemCount: hotelsName.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(
                border:
                    BorderDirectional(bottom: BorderSide(color: Colors.black))),
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(hotelsImage[index]),
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              Colors.black45, BlendMode.darken),
                        ),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10))),
                    child: Center(
                      child: TextButton(
                        onPressed: () => _makePhoneCall(hotelsPhone[index]),
                        child: Text(
                          hotelsName[index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )),
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(10))),
                  child: FlutterMap(
                    options: MapOptions(
                      center: hotelsCoordinate[index],
                      maxBounds:
                          LatLngBounds(LatLng(38.3, 67.1), LatLng(38.1, 67.4)),
                      zoom: 12,
                      interactiveFlags: InteractiveFlag.all,
                      maxZoom: 16,
                      minZoom: 9,
                      absorbPanEventsOnScrollables: false,
                      adaptiveBoundaries: false,
                      keepAlive: true,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: hotelsCoordinate[index],
                            width: 50,
                            height: 50,
                            builder: (context) => const Icon(Icons.location_pin,
                                color: Colors.red),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
