// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transport_app/components/my_text.dart';
import 'package:transport_app/models/get_data_bus/model_databus.dart';
import 'package:transport_app/models/get_data_bus/repo_databus.dart';
import 'package:transport_app/models/get_data_gas/model_datagas.dart';
import 'package:transport_app/models/get_data_gas/repo_datagas.dart';
import 'package:transport_app/models/user_location/location_service.dart';
import 'package:transport_app/models/user_location/user_location.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  //My latitude and longitude
  double my_latitude = -0.9470831999999999;
  double my_longitude = 100.41718100000003;
  LocationService locationService = LocationService();

  @override
  void dispose() {
    locationService.dispose();
    super.dispose();
  }

  // Condition
  bool _whenbusclick = false;
  Color? _buscolor = Colors.grey[600]?.withOpacity(.8);
  Color? _gascolor = Colors.blue;

  //-----------------------get data bus-----------------------
  List<databus> listbus = [];
  databusRepository busrepo = databusRepository();

  //-----------------------get data gas-----------------------
  List<datagas> listgas = [];
  datagasRepository gasrepo = datagasRepository();

  // Read
  getData() async {
    listgas = await gasrepo.getData();
    listbus = await busrepo.getData();
    setState(() {});
  }
  //================================================================

  // late BitmapDescriptor customIcon;
  // void setCustomMapPin() async {
  //   customIcon = await BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(
  //       devicePixelRatio: 2.5,
  //       size: Size(12, 12),
  //     ),
  //     'assets/icon_bus.png',
  //   );
  // }

  @override
  void initState() {
    getData();
    super.initState();
    // setCustomMapPin();
  }

  //================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Maps
          StreamBuilder<UserLocaton>(
            stream: locationService.locationStream,
            builder: (context, snapshot) => (snapshot.hasData)
                ? GoogleMap(
                    mapType: MapType.terrain,
                    initialCameraPosition: cameraStarted(),
                    // condition markers
                    markers: _whenbusclick
                        ? listbus
                            .map(
                              (datab) => customMarker(
                                double.parse(datab.lat_bus),
                                double.parse(datab.long_bus),
                                datab.id_bus,
                                // customIcon,
                              ),
                            )
                            .toSet()
                        : listgas
                            .map(
                              (datag) => customMarker(
                                double.parse(datag.lat_gas),
                                double.parse(datag.long_gas),
                                datag.id_gas,
                                // customIcon,
                              ),
                            )
                            .toSet(),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  )
                : const SizedBox(),
          ),
          // For the button
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _whenbusclick = true;
                          _buscolor = Colors.blueAccent.withOpacity(.8);
                          _gascolor = Colors.grey[600]?.withOpacity(.8);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: _buscolor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.2),
                                blurRadius: 10,
                                offset: const Offset(5, 10),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.directions_train_sharp,
                                color: Colors.white,
                                size: 15,
                              ),
                              MyText(
                                text: "Bus",
                                size: 15,
                                color: Colors.white,
                                padding: 1,
                                bold: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _whenbusclick = false;
                          _buscolor = Colors.grey[600]?.withOpacity(.8);
                          _gascolor = Colors.blueAccent.withOpacity(.8);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: _gascolor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.2),
                                blurRadius: 10,
                                offset: const Offset(5, 10),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.gas_meter,
                                color: Colors.white,
                                size: 15,
                              ),
                              MyText(
                                text: "Gas",
                                size: 15,
                                color: Colors.white,
                                padding: 1,
                                bold: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
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
                    // LatLng(-0.9470831999999999, 100.41718100000003),
                    const LatLng(-0.9470831999999999, 100.41718100000003),
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
      target: LatLng(my_latitude, my_longitude),
      zoom: 12.4746,
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
