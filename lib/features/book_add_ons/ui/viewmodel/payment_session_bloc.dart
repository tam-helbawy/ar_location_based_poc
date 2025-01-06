import 'package:base/configurations/app_states.dart';
import 'package:base/network/network_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../../../handlers/security/AESEncryptor.dart';
import '../../../../handlers/security/encrypted_value.dart';

class PaymentSessionBloc extends Cubit<AppStates> {
  PaymentSessionBloc() : super(LoadingState());
  //====================================
  //==================================== Variables
  //====================================
  EncryptedValue? sessionId;
  String countryCode = "";
  EncryptedValue? paymentId;
  InAppWebViewController? webViewController;
  //====================================
  //==================================== Functions
  //====================================
  void refreshSession() => startPaymentSession();
  Future<void> validateCard()async => await webViewController?.callAsyncJavaScript(functionBody: "submit();");
  Future<void> startPaymentSession() async {
    emit(LoadingState());
    try{
      var response = await NetworkHandler.instance.get("https://core-demo.tam.run/jovial/myfatoorah-initiate-session/");
      sessionId = AESEncryptor.instance.encrypt(response.data["Data"]["SessionId"]);
      countryCode = response.data["Data"]["CountryCode"];
      emit(LoadedState(""));
    } catch(e){
      emit(ErrorState(e.toString()));
    }
  }
}
