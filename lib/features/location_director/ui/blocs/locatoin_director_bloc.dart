import 'dart:developer';

import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/location_director/data/repo/location_director_repo.dart';
import 'package:base/features/location_director/domain/repo/loaction_director_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vector_math/vector_math_64.dart';


class LocationDirectorBloc extends Bloc<AppEvents,AppStates>{
  LocationDirectorBloc(this.routeId):super(LoadingState()){
    on<FetchDataEvent>(_getDataEvent);
    add(FetchDataEvent());
  }
  //=========================================================
  //========================================================= Variables
  //=========================================================
  List<Vector3> routes = [];
  final String routeId;
  LocationDirectorRepoInterface repo = LocationDirectorFirebaseRepo();
  //=========================================================
  //========================================================= Functions
  //=========================================================
  Future<List<Vector3>> _requestRoutes(String routeId)async{
    return await repo.getLocationRoute(routeId);
  }
  //=========================================================
  //========================================================= Events
  //=========================================================
  _getDataEvent(FetchDataEvent event,Emitter emit)async{
    emit(LoadingState());
    try{
      routes = await _requestRoutes(routeId);
      if(routes.isNotEmpty)emit(LoadedState(routes));
      else emit(EmptyState());
    }
    catch(e){
      log("Helbawy: ${e.toString()}");
      emit(ErrorState(e.toString()));
    }
  }
}