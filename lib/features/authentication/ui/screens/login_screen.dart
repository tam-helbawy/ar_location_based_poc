import 'dart:developer';

import 'package:base/app/widgets/fields/text_input_field.dart';
import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TextInputField(
                labelText: "Email",
                hintText: "Enter your email",
                keyboardType: TextInputType.emailAddress,
                controller: loginBloc.emailController,
              ),
              TextInputField(
                labelText: "Password",
                hintText: "Enter your password",
                keyboardType: TextInputType.visiblePassword,
                controller: loginBloc.passwordController,
              ),
              SizedBox(height: 36),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 56,
                child: BlocConsumer<LoginBloc, AppStates>(
                    listener: (context,state) {
                      if(state is SuccessState){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Success")));
                      }
                      if(state is ErrorState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                      }
                    },
                  builder: (context, state) {
                    if(state is LoadingState){
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(
                      onPressed: () {
                        loginBloc.add(ClickEvent());
                      },
                      child: Text("Login"),
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
