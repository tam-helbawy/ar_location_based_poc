import 'package:base/app/bloc/settings_cubit.dart';
import 'package:flutter/material.dart';

class InvoiceInfo extends StatelessWidget {
  const InvoiceInfo({
    required this.infoTitle,
    required this.infoValue,
    this.showLoading = false,
    this.infoValueTextColor = Colors.black,
  });

  final String infoTitle;
  final String infoValue;
  final showLoading;
  final Color infoValueTextColor;

  @override
  Widget build(BuildContext context) {
    bool isTablet = SettingsCubit.instance.isTablet;
    return Row(
      children: [
        Text(infoTitle, style: TextStyle(fontSize: isTablet? 14 : 12, fontWeight: FontWeight.w700, color: Colors.black)),
        Spacer(),
        if (!showLoading) Text(infoValue, style: TextStyle(fontSize: isTablet? 14 : 12, fontWeight: isTablet? FontWeight.w600 :FontWeight.w400, color: infoValueTextColor)),
        if (showLoading) SizedBox(width: 18, height: 18, child: Center(child: CircularProgressIndicator(strokeWidth: 2))),
      ],
    );
  }
}
