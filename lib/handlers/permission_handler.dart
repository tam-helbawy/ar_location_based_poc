import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  Future<bool> _checkPermission(Permission permission) async {
    var status = await permission.status;
    switch (status) {
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.denied:
        var response = await permission.request();
        return response.isGranted;
      case PermissionStatus.permanentlyDenied:
        return false;
      default:
        return false;
    }
  }

  Future<bool> checkCameraPermission() async {
    return await _checkPermission(Permission.camera);
  }

  Future<bool> checkStoragePermission() async {
    return await _checkPermission(Permission.storage);
  }

  Future<bool> checkLocationPermission() async {
    return await _checkPermission(Permission.location);
  }

  Future<bool> checkContactsPermission() async {
    return await _checkPermission(Permission.contacts);
  }
}
