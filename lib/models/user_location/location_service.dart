import 'dart:async';

import 'package:location/location.dart';
import 'package:transport_app/models/user_location/user_location.dart';

class LocationService {
  Location location = Location();
  final StreamController<UserLocaton> _locationStreamController =
      StreamController<UserLocaton>();
  Stream<UserLocaton> get locationStream => _locationStreamController.stream;

  LocationService() {
    location.requestPermission().then((permissionStatus) {
      if (permissionStatus == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationData) {
          _locationStreamController.add(
            UserLocaton(
              latitude: double.parse(locationData.latitude.toString()),
              longitude: double.parse(locationData.longitude.toString()),
            ),
          );
        });
      }
    });
  }

  void dispose() => _locationStreamController.close();
}
