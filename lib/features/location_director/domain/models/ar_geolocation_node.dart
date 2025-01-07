import 'dart:math';
import 'dart:developer' as dev;
import 'package:ar_flutter_plugin_flutterflow/models/ar_node.dart';
import 'package:base/features/location_director/domain/models/map_location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vector_math/vector_math_64.dart' ;

class ARGeolocationNode extends ARNode {
  final MapLocation location;
  final MapLocation userLocation;
  ARGeolocationNode({
    required super.type,
    required super.uri,
    required this.location,
    required this.userLocation,
    super.name,
    super.rotation,
    super.scale,
  }){
    super.position = _arWorldPosition();
  }

  _calculateWorldVector3(MapLocation location) {
    const double earthRadius = 6371000; // Earth's radius in meters

    // Convert degrees to radians
    double latRad = location.latitude * pi / 180;
    double lngRad = location.longitude * pi / 180;

    // Calculate ECEF coordinates
    double x = (earthRadius + location.altitude) * cos(latRad) * cos(lngRad);
    double y = (earthRadius + location.altitude) * cos(latRad) * sin(lngRad);
    double z = (earthRadius + location.altitude) * sin(latRad);

    // Return as a Vector3
    return Vector3(x, 0, z);
  }

  Vector3 _arWorldPosition() {
    Vector3 worldLocation = _calculateWorldVector3(location);
    dev.log("Helbawy world: $worldLocation");

    Vector3 userWorldLocation = _calculateWorldVector3(userLocation);
    dev.log("Helbawy user: $worldLocation");

    Vector3 relativeLocation = userWorldLocation - worldLocation;
    dev.log("Helbawy relative: $relativeLocation");
    return relativeLocation;
  }

}
