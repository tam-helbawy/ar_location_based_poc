import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import '../widgets/service_card_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ServiceCardView(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.main);
              },
              title: 'AR View',
            ),
            SizedBox(height: 16),
            ServiceCardView(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.seatView360);
              },
              title: 'Seat View 360',
            ),
          ]
        ),
      ),
    );
  }
}