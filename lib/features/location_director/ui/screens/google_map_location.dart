// import 'dart:async';
// import 'dart:developer';
// import 'package:base/configurations/app_states.dart';
// import 'package:base/features/location_director/domain/models/ar_geolocation_node.dart';
// import 'package:base/features/location_director/domain/models/map_location.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_compass/flutter_compass.dart';
// import 'package:geobase/coordinates.dart' as cord;
// import 'package:geolocator/geolocator.dart';
// import 'package:vector_math/vector_math_64.dart' as vector;
// import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
// import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
// import 'package:ar_flutter_plugin/datatypes/node_types.dart';
// import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
// import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
// import 'package:ar_flutter_plugin/models/ar_node.dart';
// import 'package:flutter/material.dart';
//
// import '../blocs/locatoin_director_bloc.dart';
//
// class GoogleLocationARView extends StatefulWidget {
//   const GoogleLocationARView({super.key});
//
//   @override
//   State<GoogleLocationARView> createState() => _GoogleLocationARViewState();
// }
//
// class _GoogleLocationARViewState extends State<GoogleLocationARView> {
//   ARSessionManager? arSessionManager;
//   ARObjectManager? arObjectManager;
//   ARLocationManager? arLocationManager;
//   void onARViewCreated(ARSessionManager arSessionManager, ARObjectManager arObjectManager, ARAnchorManager arAnchorManager, ARLocationManager arLocationManager) {
//     this.arSessionManager = arSessionManager;
//     this.arObjectManager = arObjectManager;
//     this.arLocationManager = arLocationManager;
//     this.arSessionManager!.onInitialize(
//           showFeaturePoints: false,
//           showPlanes: true,
//           showWorldOrigin: true,
//           handleTaps: true,
//         );
//     this.arObjectManager!.onInitialize();
//     setObject();
//   }
//
//   @override
//   void dispose() {
//     arSessionManager!.dispose();
//     super.dispose();
//   }
//
//   void setObject() async {
//     log("Helbawy: setObjets");
//     await Geolocator.requestPermission();
//     Position userLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
//     log("Helbawy: ${userLocation.latitude} ${userLocation.longitude} ${userLocation.altitude}");
//     var geoPoint =  cord.Geographic(lat: 31.03103347, lon: 31.39325191,elev: 20.23);
//     geoPoint.p
//     log("Helbawy: ${geoPoint.x} ${geoPoint.y} ${geoPoint.z}");
//     ARGeolocationNode node = ARGeolocationNode(
//       type: NodeType.localGLTF2,
//       uri: "assets/glb/location_mark.gltf",
//       location: MapLocation(latitude:31.03103347, longitude: 31.39325191, altitude: 20.32),
//       userLocation: MapLocation(latitude: userLocation.latitude, longitude: userLocation.longitude, altitude: userLocation.altitude),
//     );
//     await arObjectManager!.addNode(node);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ARView(
//         onARViewCreated: onARViewCreated,
//         planeDetectionConfig: PlaneDetectionConfig.horizontal,
//       ),
//     );
//   }
// }
//
// class AugmentedRealityScreen extends StatelessWidget {
//   const AugmentedRealityScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GoogleLocationARView();
//   }
// }
