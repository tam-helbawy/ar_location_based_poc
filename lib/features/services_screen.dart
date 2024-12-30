import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.main);
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'AR Navigation',
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.seatView360);
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Seat View 360',
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
