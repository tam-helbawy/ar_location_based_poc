import 'package:base/configurations/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<AppStates>{
  UserCubit._internal():super(InitialState());
  static UserCubit instance = UserCubit._internal();
}