import 'package:vector_math/vector_math_64.dart';

abstract class LocationDirectorRepoInterface {
  Future<List<Vector3>> getLocationRoute(String routeId);
}