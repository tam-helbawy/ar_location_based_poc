import 'package:encrypt/encrypt.dart';

import 'encrypted_value.dart';
import 'encryptor_interface.dart';
class AESEncryptor extends KeyEncryptor{
  static AESEncryptor? _instance;
  static AESEncryptor get instance => _instance??AESEncryptor.init();
  AESEncryptor._ins();
  factory AESEncryptor.init(){
    _instance ??= AESEncryptor._ins();
    _instance!.setKey="8bvnJ68dM9MuWKkPBjjQpcI5TVVWgzDxnSclE4U1NEo=";

    return _instance!;
  }
  //==============================================
  //============================================== Variables
  //==============================================
  late Encrypter _encryptor;

  @override
  EncryptedValue encrypt(String value){
    IV randomIV = IV.fromLength(16);
    _encryptor = Encrypter(AES(Key.fromUtf8(getKey)));
    final encrypted = _encryptor.encrypt(value.toString(), iv: randomIV);

    return EncryptedValue(encryptedValue: encrypted.base64,valueType: value.runtimeType, ivKey: randomIV.base64);
  }

  @override
  dynamic decrypt(EncryptedValue encryptedValue){
    _encryptor = Encrypter(AES(Key.fromUtf8(getKey)));
    final decrypted = _encryptor.decrypt(Encrypted.from64(encryptedValue.encryptedValue), iv: IV.fromBase64(encryptedValue.ivKey));
    return decrypted;
  }
}



