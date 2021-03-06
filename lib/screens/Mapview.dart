import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/Agency/AddOfferView.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late GoogleMapController mapController;
  final Set<Marker> markers = new Set();
  final LatLng _center = const LatLng(36, 6);
  late LatLng lastPosition;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps View'),
        backgroundColor: Color(0xff235265),
        leading: IconButton(
         icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 244, 246, 247),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AddOfferView()));
          },
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: markers,
        onLongPress: (LatLng pos) {
          _setPosition(pos);
        },
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(_center.toString()),
        position: _center, //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add second marker
        markerId: MarkerId(_center.toString()),
        position: LatLng(35.0099116, 6.3132343), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }

  _setPosition(LatLng pos) {
    lastPosition = pos;
    setState(() {
      markers.clear();
      markers.add(Marker(
        markerId: MarkerId(pos.toString()),
        position: pos, //position of marker
        infoWindow: InfoWindow(
            //popup info
            // title: 'Marker Title Second ',
            // snippet: 'My Custom Subtitle',
            ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
  }
}