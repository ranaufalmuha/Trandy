import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transport_app/models/get_data_bus/model_databus.dart';
import 'package:transport_app/models/get_data_bus/repo_databus.dart';
import 'package:transport_app/models/user_location/location_service.dart';
import 'package:transport_app/pages/schedule_page.dart';

import '../components/constants.dart';

class RouteMap extends StatefulWidget {
  // need to fix
  final BusLat;
  final BusLng;
  final BusName;
  const RouteMap({
    super.key,
    required this.BusLat,
    required this.BusLng,
    required this.BusName,
  });

  @override
  State<RouteMap> createState() => _RouteMapState();
}

class _RouteMapState extends State<RouteMap> {
  //My latitude and longitude
  LatLng sourceLocation = LatLng(-0.9470831999999999, 100.41718100000003);
  LatLng destionation = LatLng(-0.9370831999999999, 100.41718100000003);

  LocationService locationService = LocationService();

  // Markers
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;

  //maps
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destionation.latitude, destionation.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/icon_bus.png")
        .then(
      (icon) {
        sourceIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/bus_icon.png")
        .then(
      (icon) {
        destinationIcon = icon;
      },
    );
  }

  @override
  void initState() {
    getPolyPoints();
    setCustomMarkerIcon();
    super.initState();
  }

  @override
  void dispose() {
    locationService.dispose();
    super.dispose();
  }

  // Condition
  bool _whenbusclick = false;
  Color? _buscolor = Colors.grey[600]?.withOpacity(.8);

  //-----------------------get data bus-----------------------
  List<databus> listbus = [];
  databusRepository busrepo = databusRepository();

  // Read
  getData() async {
    listbus = await busrepo.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // destionation =
    //     LatLng(double.parse(widget.BusLat), double.parse(widget.BusLng));

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => const SchedulePage(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: cameraStarted(),
        // condition markers
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            points: polylineCoordinates,
            color: Colors.blue,
            width: 6,
          ),
        },
        markers: {
          Marker(
            markerId: const MarkerId("destination"),
            position: destionation,
            icon: destinationIcon,
            infoWindow: InfoWindow(
              title: widget.BusName,
            ),
          ),
          Marker(
            markerId: const MarkerId("source"),
            position: sourceLocation,
            // icon: sourceIcon,
          ),
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 35),
        child: Row(
          children: [
            FloatingActionButton.extended(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                  CameraUpdate.newLatLng(
                    sourceLocation,
                  ),
                );
              },
              label: const Text('mylocation'),
              icon: const Icon(Icons.my_location_outlined),
            ),
          ],
        ),
      ),
    );
  }

  //when started
  CameraPosition cameraStarted() {
    return CameraPosition(
      target: sourceLocation,
      zoom: 15,
    );
  }

  Marker customMarker(double lat, double lng, String id) {
    return Marker(
      markerId: MarkerId(id),
      position: LatLng(lat, lng),
      // icon: customIcon,
    );
  }
}
