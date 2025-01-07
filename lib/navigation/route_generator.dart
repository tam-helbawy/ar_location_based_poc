import 'package:base/features/home/ui/screens/home_screen.dart';
import 'package:base/handlers/qr_code_handler.dart';
import 'package:flutter/material.dart';

import '../features/location_director/ui/screens/scanning_qr_screen.dart';
import '../features/seat_view_360/ui/screens/360_view.dart';
import 'app_routes.dart';

_createRoute(Widget page) {
  return MaterialPageRoute(builder: (context) => page);
}

Route generateRoute(settings) {
  switch (settings.name) {
    case AppRoutes.main:
      return _createRoute(ScanningQrScreen());
    case AppRoutes.qrScanner:
      return _createRoute(QrCodeHandler());
    case AppRoutes.seatView360:
      return _createRoute(SeatView360Screen());
    case AppRoutes.services:
      return _createRoute(HomeScreen());
    default:
      return _createRoute(SizedBox());
  }
}
