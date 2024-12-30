import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class SeatView360Screen extends StatelessWidget {
  const SeatView360Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seat View 360'),
      ),
      body: Center(
        child: Panorama(
          child: Image.asset('assets/images/stadium.jpg'),
        ),
      ),
    );
  }
}
