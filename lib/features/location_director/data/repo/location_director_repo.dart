import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vector_math/vector_math_64.dart';

import '../../domain/repo/loaction_director_repo.dart';

class LocationDirectorFirebaseRepo extends LocationDirectorRepoInterface{
  @override
  Future<List<Vector3>> getLocationRoute(String routeId) async{
    var response = await FirebaseFirestore.instance.collection("Routes").doc(routeId).get();
    log(response.data()!.toString());
    List routes = response.data()!["routes"];
    List<Vector3> vectors = [];
    for(var vectorData in routes){
      vectors.add(Vector3(vectorData["x"].toDouble(), vectorData["y"].toDouble(), vectorData["z"].toDouble()));
    }
    return vectors;
  }

}