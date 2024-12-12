import 'package:base/features/test.dart';
import 'package:base/handlers/qr_code_handler.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';

_createRoute(Widget page){
  return MaterialPageRoute(builder: (context) => page);
}

Route generateRoute (settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return _createRoute(SizedBox());
    case AppRoutes.main:
      return _createRoute(Test());
    case AppRoutes.qrScanner:
      return _createRoute(QrCodeHandler());
    default:
      return _createRoute(SizedBox());
  }
}