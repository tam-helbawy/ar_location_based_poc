import 'dart:io';
import 'package:base/configurations/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../../../handlers/security/AESEncryptor.dart';
import '../viewmodel/payment_session_bloc.dart';

class PaymentPanel extends StatelessWidget {
  const PaymentPanel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSessionBloc, AppStates>(
      builder: (context, state) {
        var bloc = BlocProvider.of<PaymentSessionBloc>(context);
        return Column(
          children: [
            if (Platform.isIOS)
              Container(
                width: double.infinity,
                height: 38,
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InAppWebView(
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      //applicationNameForUserAgent: "TAM",
                      userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Safari/605.1.15",
                      supportZoom: false,
                      verticalScrollBarEnabled: false,
                      horizontalScrollBarEnabled: false,
                    ),
                    ios: IOSInAppWebViewOptions(
                      allowsLinkPreview: true,
                      applePayAPIEnabled: true,
                    ),
                  ),
                  onLoadStart: (controller, url) {},
                  initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse("https://verse-stg.tam.run/jovial/publicPayment?sessionId=${AESEncryptor.instance.decrypt(bloc.sessionId!)}&countryCode=${bloc.countryCode}&amount=103.5&currencyCode=SAR"))),
                  onWebViewCreated: (controller) {
                    bloc.webViewController = controller;
                  },
                ),
              ),
            if (Platform.isIOS) SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 150,
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: InAppWebView(
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Safari/605.1.15",
                    supportZoom: false,
                    verticalScrollBarEnabled: false,
                    horizontalScrollBarEnabled: false,
                    transparentBackground: true,
                  ),
                  ios: IOSInAppWebViewOptions(
                    allowsLinkPreview: true,
                  ),
                ),
                initialData: InAppWebViewInitialData(data: cardWepPageHTML("AESEncryptor.instance.decrypt(bloc.sessionId!)", "bloc.countryCode")),
                onWebViewCreated: (controller) {
                  bloc.webViewController = controller;
                  controller.addJavaScriptHandler(
                    handlerName: 'payHandler',
                    callback: (args) {},
                  );
                  controller.addJavaScriptHandler(
                    handlerName: 'validationErrorHandler',
                    callback: (args) {},
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  String cardWepPageHTML(String sessionId, countryCode) {
    // String fieldDirection = allTranslations.getPreferredLanguage() == "ar" ? "rtl" : "ltr" ;
    return """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
      body {
        margin: 5;
        padding: 1;
        width: 95%;
        box-sizing: border-box;
        background-color: transparent
      }
      
      card-element {
        padding: 10px 20px 30px 16px;
        justify-content: center;
        width: 100%;
      }
    </style>
</head>
<body>

<div>
    <div id="card-element"></div>
</div>
<script src="https://demo.myfatoorah.com/cardview/v2/session.js"></script>
<script>
    var cardPaymentFieldsConfig = {
      sessionId: "dfc6a3c3-df09-44cb-9c6a-0a6375752da6",
      countryCode: "KWT",
      cardViewId: "card-element",
      supportedNetworks: "v,m,ae,md",
      style: {
        hideCardIcons: true,
        direction: "rtl",
        
        cardHeight: 130,
        tokenHeight: 130,
        input: {
          color: "black",
          fontSize: "13px",
          fontFamily: "sans-serif",
          inputHeight: "30px",
          inputMargin: "0px",
          borderColor: "c7c7c7",
          borderWidth: "1px",
          borderRadius: "2px",
          boxShadow: "",
          placeHolder: {
            holderName: "اسم حامل البطاقة",
            cardNumber: "رقم البطاقة",
            expiryDate: "تاريخ الانتهاء",
            securityCode: "CVV",
          }
        },
     
        label: {
          display: false,
          color: "black",
          fontSize: "13px",
          fontWeight: "normal",
          fontFamily: "sans-serif",
          text: {
            holderName: "اسم حامل البطاقة",
            cardNumber: "رقم البطاقة",
            expiryDate: "تاريخ الانتهاء",
            securityCode: "CVV",
          },
        },
        error: {
          borderColor: "red",
          borderRadius: "8px",
          boxShadow: "0px",
        },
      },
  };
  myFatoorah.init(cardPaymentFieldsConfig);
  function submit() {
        myFatoorah.submit()
        .then(function (response) {
        var sessionId = response.sessionId;
        var cardBrand = response.cardBrand;
        var cardIdentifier = response.cardIdentifier;
        // return response to the flutter side!
        window.flutter_inappwebview.callHandler('payHandler', {sessionId: sessionId, cardBrand: cardBrand, cardIdentifier: cardIdentifier})
        })
        .catch(function (error) {
        
        window.flutter_inappwebview.callHandler('validationErrorHandler', {code: 400, message: "Your Credit Card is invalid"})
            
        });
    }
</script>
</body>
</html>""";
  }
}
