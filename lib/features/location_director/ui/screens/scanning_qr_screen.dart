import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import 'choose_location_screen.dart';

class ScanningQrScreen extends StatefulWidget {
  const ScanningQrScreen({super.key});

  @override
  State<ScanningQrScreen> createState() => _ScanningQrScreenState();
}

class _ScanningQrScreenState extends State<ScanningQrScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isDone = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     controller!.resumeCamera();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(.2),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: QRView(
        key: qrKey,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 300,
        ),
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
          (scanData) {
        result = scanData;
        if (!isDone) {
          isDone = true;
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseLocationScreen()));
        }
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }
}
