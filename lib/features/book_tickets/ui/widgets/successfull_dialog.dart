import 'dart:developer';

import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<void> showSuccessDialog({required BuildContext context}) async {
  await showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: SettingsCubit.instance.isTablet? EdgeInsets.symmetric(horizontal: 100):EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset("assets/json/success.json", width: 118, height: 118, repeat: false, fit: BoxFit.cover),
            Text(
              "Booked Successfully",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: context.theme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Ok",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
