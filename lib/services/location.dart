import 'package:geolocator/geolocator.dart';

class Location {
  double? lat;
  double? long;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 1000,
  );

  Future<void> getCurrentLocation() async {
    Position position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    lat = position.latitude;
    long = position.longitude;
  }
}
