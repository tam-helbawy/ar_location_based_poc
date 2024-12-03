import 'dart:developer';

import 'package:base/features/authentication/data/repo/authentication_repo_imp.dart';
import 'package:base/features/authentication/domain/repo/authentication_repo_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/app_events.dart';
import '../../../../configurations/app_states.dart';

class LoginBloc extends Bloc<AppEvents,AppStates>{
  LoginBloc():super(InitialState()){
    on<ClickEvent>(loginEvent);
  }
  //==================================
  //================================== Variables
  //==================================
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationRepoInterface authenticationRepo = AuthenticationRepoImp();
  //==================================
  //================================== Functions
  //==================================
  _login(String email,String password) async{
    await authenticationRepo.register(email, password);

  }
  //==================================
  //================================== Events
  //==================================
  void loginEvent(ClickEvent event, Emitter emit)async {
    emit(LoadingState());
    try{
      await _login(emailController.text, passwordController.text);
      emit(SuccessState());
    } on FirebaseAuthException catch(e){
      log(e.code.toString());
      emit(ErrorState(e.code.toString()));
    } catch(e){
      emit(ErrorState(e.toString()));
    }
  }

}