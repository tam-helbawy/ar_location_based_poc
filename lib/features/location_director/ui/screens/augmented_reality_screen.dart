// import 'dart:async';
// import 'dart:developer';
//
// import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
// import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
// import 'package:ar_flutter_plugin/datatypes/node_types.dart';
// import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
// import 'package:ar_flutter_plugin/models/ar_node.dart';
// import 'package:base/configurations/app_states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_compass/flutter_compass.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:vector_math/vector_math_64.dart' as vectormport 'package:vector_math/vector_math_64.dart' as vector;
// //
// // import '../blocs/locatoin_director_bloc.dart';
// //
// // class LocationRouteARView extends StatefulWidget {
// //   const LocationRouteARView(this.routePoints, {super.key});
// //
// //   final List<vector.Vector3> routePoints;
// //
// //   @override
// //   State<LocationRouteARView> createState() => _LocationRouteARViewState();
// // }
// //
// // class _LocationRouteARViewState extends State<LocationRouteARView> {
// //   ARSessionManager? arSessionManager;
// //   ARObjectManager? arObjectManager;
// //   String currentDistance = "Unknown";
// //   String compassHeading = "Unknown";
// //   String currentLocation = "Unknown";
// //
// //   void onARViewCreated(
// //       ARSessionManager arSessionManager,
// //       ARObjectManager arObjectManager,
// //       ARAnchorManager arAnchorManager,
// //       ARLocationManager arLocationManager) async {
// //     this.arSessionManager = arSessionManager;
// //     this.arObjectManager = arObjectManager;
// //     this.arSessionManager!.onInitialize(
// //           showFeaturePoints: false,
// //           showPlanes: true,
// //           showWorldOrigin: true,
// //           handleTaps: true,
// //         );
// //     this.arObjectManager!.onInitialize();
// //     for (var index = 0; index < widget.routePoints.length; index++) {
// //       ARNode node = ARNode(
// //         type: NodeType.localGLTF2,
// //         uri:
// //             "assets/glb/${index != widget.routePoints.length - 1 ? "mark" : "location_mark"}.gltf",
// //         scale: vector.Vector3(1, 1, 1),
// //         position: widget.routePoints[index], // 1 meter in front of the user
// //       );
// //       await this.arObjectManager?.addNode(node);
// //       setState(() {});
// //     }
// //
// //     this.arSessionManager!.onPlaneOrPointTap = (e) {
// //       print(e.first);
// //       ARNode node = ARNode(
// //         type: NodeType.localGLTF2,
// //         uri: "assets/glb/mark.gltf",
// //         scale: vector.Vector3(1, 1, 1),
// //         position:
// //             e.first.worldTransform.forward, // 1 meter in front of the user
// //       );
// //       this.arObjectManager!.addNode(node,
// //           planeAnchor: ARPlaneAnchor(transformation: e.first.worldTransform));
// //       setState(() {});
// //     };
// //   }
// //
// //   @override
// //   void dispose() {
// //     arSessionManager?.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         body: ARView(
// //           onARViewCreated: onARViewCreated,
// //           planeDetectionConfig: PlaneDetectionConfig.horizontal,
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class AugmentedRealityScreen extends StatelessWidget {
// //   const AugmentedRealityScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: BlocBuilder<LocationDirectorBloc, AppStates>(
// //         builder: (context, state) {
// //           if (state is LoadingState)
// //             return Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           else if (state is EmptyState)
// //             return Center(
// //               child: Text("No Route Avilable"),
// //             );
// //           else if (state is ErrorState)
// //             return Center(
// //               child: Text("Error"),
// //             );
// //           else {
// //             var bloc = BlocProvider.of<LocationDirectorBloc>(context);
// //             return LocationRouteARView(bloc.routes);
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
