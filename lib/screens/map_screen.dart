import 'dart:math' show sin, cos, sqrt, atan2;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';

class mapscreen extends StatefulWidget {
  const mapscreen({Key? key}) : super(key: key);

  @override
  State<mapscreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<mapscreen> {
  String currentAddress = '';
  String destinationAddress = '';
  LatLng currentPosition = LatLng(0, 0);
  LatLng destinationPosition = LatLng(-8.164972, 113.717556);

  MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _getDestinationAddress();
  }

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final addresses = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (addresses.isNotEmpty) {
      final address = addresses.first;
      final formattedAddress =
          '${address.street}, ${address.locality}, ${address.country}';
      setState(() {
        currentAddress = formattedAddress;
      });
    }

    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.https(
        "www.google.com", "maps/place/Pantai+payangan/@-8.4364088,113.581299");
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Future<void> _getDestinationAddress() async {
    final addresses = await placemarkFromCoordinates(
      destinationPosition.latitude,
      destinationPosition.longitude,
    );

    if (addresses.isNotEmpty) {
      final address = addresses.first;
      final formattedAddress =
          '${address.street}, ${address.locality}, ${address.country}';
      setState(() {
        destinationAddress = formattedAddress;
      });
    }
  }

  double calculateDistance(
      double startLat, double startLng, double endLat, double endLng) {
    const int earthRadius = 6371; // Radius of the earth in kilometers

    double latDiff = degreesToRadians(endLat - startLat);
    double lngDiff = degreesToRadians(endLng - startLng);

    double a = sin(latDiff / 2) * sin(latDiff / 2) +
        cos(degreesToRadians(startLat)) *
            cos(degreesToRadians(endLat)) *
            sin(lngDiff / 2) *
            sin(lngDiff / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = earthRadius * c; // Distance in kilometers
    return distance;
  }

  double degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  @override
  Widget build(BuildContext context) {
    double distance = calculateDistance(
      currentPosition.latitude,
      currentPosition.longitude,
      destinationPosition.latitude,
      destinationPosition.longitude,
    );

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Keterangan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Jarak:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${distance.toStringAsFixed(2)} km',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                center: destinationPosition,
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 40.0,
                      height: 40.0,
                      point: destinationPosition,
                      builder: (ctx) => Container(
                        child: Icon(
                          Icons.flag,
                          color: Colors.blue,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lokasi Tujuan:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${destinationPosition.latitude.toStringAsFixed(6)},${destinationPosition.longitude.toStringAsFixed(6)}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Alamat: $destinationAddress',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  'Lokasimu Saat Ini:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${currentPosition.latitude.toStringAsFixed(6)},${currentPosition.longitude.toStringAsFixed(6)}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Alamat: $currentAddress',
                  style: TextStyle(fontSize: 18),
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL(
                        "https://www.google.com/maps/search/?api=1&query=-8.164972,113.717556");
                  },
                  child: const Text("Launch URL"),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            iconSize: 20.0,
            selectedIconTheme: IconThemeData(size: 28.0),
            selectedItemColor: Color.fromARGB(255, 46, 90, 172),
            unselectedItemColor: Colors.black,
            selectedFontSize: 16.0,
            unselectedFontSize: 12,
            currentIndex: 1,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Icon(Icons.home),
                  onTap: () {},
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.navigation),
                label: "map",
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Icon(Icons.person),
                  onTap: () {},
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
