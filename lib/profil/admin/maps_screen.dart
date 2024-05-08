import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late StreamSubscription<LocationData> _locationSubscription;
  LocationData? _currentLocation;
 int _zoomLevel = 14;

  @override
  void initState() {
    super.initState();
    _initializeLocationTracking();
  }

  @override
  void dispose() {
    _locationSubscription.cancel();
    super.dispose();
  }

  void _initializeLocationTracking() async {
    var location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationSubscription = location.onLocationChanged.listen((LocationData newLocation) {
      setState(() {
        _currentLocation = newLocation;
      });
    });
  }

  void _zoomIn() {
    setState(() {
      _zoomLevel += 1;
    });
  }

  void _zoomOut() {
    setState(() {
      if (_zoomLevel > 1) {
        _zoomLevel -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _currentLocation == null
        ? const Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              SfMaps(
                layers: [
                  MapTileLayer(
                    initialFocalLatLng: MapLatLng(
                      _currentLocation!.latitude!,
                      _currentLocation!.longitude!,
                    ),
                    initialZoomLevel: _zoomLevel,
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    markerBuilder: (BuildContext context, int index) {
                      return MapMarker(
                        latitude: _currentLocation!.latitude!,
                        longitude: _currentLocation!.longitude!,
                        size: const Size(20, 20),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.red[800],
                        ),
                      );
                    },
                  ),
                ],
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: _zoomIn,
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _zoomOut,
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
