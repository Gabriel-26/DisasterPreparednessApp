import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EvacuationCentersMap extends StatefulWidget {
  @override
  _EvacuationCentersMapState createState() => _EvacuationCentersMapState();
}

class _EvacuationCentersMapState extends State<EvacuationCentersMap> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(10.3157, 123.8854); // Cebu City coordinates
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;

  // Sample evacuation centers
  final List<LatLng> _evacuationCenters = [
    LatLng(10.3235, 123.9159),
    LatLng(10.3126, 123.9185),
    LatLng(10.3145, 123.8937),
    LatLng(10.3037, 123.9061),
    LatLng(10.3078, 123.8893),
  ];

  @override
  void initState() {
    super.initState();
    _evacuationCenters.forEach((LatLng point) {
      _markers.add(
        Marker(
          markerId: MarkerId(point.toString()),
          position: point,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: 'Evacuation Center',
            snippet: 'A safe zone for disaster victims',
          ),
        ),
      );
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: 'My Location',
            snippet: 'This is where I am',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map of Evacuation Centers'),
        backgroundColor: Colors.green[700],
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Positioned(
            bottom: 40,
            left: 10,
            child: FloatingActionButton(
              onPressed: _onAddMarkerButtonPressed,
              tooltip: 'Add Marker',
              backgroundColor: Colors.green[700],
              child: Icon(Icons.add_location),
            ),
          ),
        ],
      ),
    );
  }
}
