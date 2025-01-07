import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:base/configurations/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../blocs/locatoin_director_bloc.dart';

class LocationRouteARView extends StatefulWidget {
  const LocationRouteARView(this.routePoints, {super.key});

  final List<vector.Vector3> routePoints;

  @override
  State<LocationRouteARView> createState() => _LocationRouteARViewState();
}

class _LocationRouteARViewState extends State<LocationRouteARView> {
  late ARKitController arkitController;
  String currentDistance = "Unknown";
  String compassHeading = "Unknown";
  String currentLocation = "Unknown";

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    for (var index = 0; index < widget.routePoints.length; index++) {
      final node = ARKitGltfNode(
        assetType: AssetType.flutterAsset,
        position: widget.routePoints[index],
        scale: vector.Vector3(1, 1, 1),
        url:
            "assets/glb/${index != widget.routePoints.length - 1 ? "result" : "location_mark"}.gltf",
      );
      this.arkitController.add(node);
    }
  }

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ARKitSceneView(
        onARKitViewCreated: onARKitViewCreated,
        planeDetection: ARPlaneDetection.horizontal,
        debug: true,
      ),
    );
  }
}

class AugmentedRealityScreen extends StatelessWidget {
  const AugmentedRealityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationDirectorBloc, AppStates>(
        builder: (context, state) {
          if (state is LoadingState)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (state is EmptyState)
            return Center(
              child: Text("No Route Avilable"),
            );
          else if (state is ErrorState)
            return Center(
              child: Text("Error"),
            );
          else {
            var bloc = BlocProvider.of<LocationDirectorBloc>(context);
            return LocationRouteARView(bloc.routes);
          }
        },
      ),
    );
  }
}
