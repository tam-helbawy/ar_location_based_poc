import 'dart:io';

import 'package:base/features/location_director/ui/blocs/locatoin_director_bloc.dart';
import 'package:base/features/location_director/ui/screens/ar_kit_screen.dart';
import 'package:base/features/location_director/ui/screens/augmented_reality_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseLocationScreen extends StatelessWidget {
  const ChooseLocationScreen({super.key});

  final List<String> locations = const [
    "Outsource Room",
    "Theatre",
    "Cafeteria",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: locations.length,
          padding: const EdgeInsets.all(24),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) =>
                          LocationDirectorBloc(locations[index]),
                      child: Platform.isIOS
                          ? const AugmentedRealityForIOSScreen()
                          : const AugmentedRealityForAndroidScreen(),
                    ),
                  ),
                );
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    locations[index],
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 24);
          },
        ),
      ),
    );
  }
}
