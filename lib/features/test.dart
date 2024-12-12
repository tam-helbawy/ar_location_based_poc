import 'package:flutter/material.dart';

import '../handlers/file_opner.dart';
import '../navigation/app_routes.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String? qrCodeResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              // qrCodeResult = (await Navigator.pushNamed(context, AppRoutes.qrScanner)) as String;
              // setState(() {});
              FileOpener().openFileFromStorage();
            },
            child: const Text("Scan QR Code"),
          ),
          SizedBox(height: 24),
          Text(qrCodeResult ?? "No Code")
        ],
      ),
    );
  }
}
