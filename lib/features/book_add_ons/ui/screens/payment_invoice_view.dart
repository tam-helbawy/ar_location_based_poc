import 'package:base/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodel/book_add_ons_bloc.dart';
import '../widgets/invoice_info.dart';
import '../widgets/payment_panel.dart';

class PaymentInvoiceView extends StatelessWidget {
  const PaymentInvoiceView({super.key});


  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<BookAddOnsBloc>(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //==========================================
                //========================================== Invoice Summary
                //==========================================
                Text(
                  "Invoice Summery",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey[300]!),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey[300]!, width: 1),
                  ),
                  child: Column(
                    children: [
                      InvoiceInfo(infoTitle: "Add-ons count", infoValue: "${bloc.totalAdditions}"),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Divider(
                          height: 0,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      InvoiceInfo(infoTitle: "Summation", infoValue: "${bloc.totalInvoicePrice} ${"SAR"}"),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Divider(
                          height: 0,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      InvoiceInfo(
                        infoTitle: "Total",
                        infoValue: "${bloc.totalInvoicePrice.toStringAsFixed(2)} ${"SAR"}",
                        infoValueTextColor: context.theme.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //==========================================
          //========================================== Payment Methods
          //==========================================
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Image.asset("assets/images/myfatoorah.png"),
          ),
        ],
      ),
    );
  }
}
