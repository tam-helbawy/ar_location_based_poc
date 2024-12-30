class EncryptedValue {
  late String _encryptedValue;
  late String _ivKey;
  Type valueType;
  String get encryptedValue => _encryptedValue;
  String get ivKey => _ivKey;

  EncryptedValue({required String encryptedValue, required this.valueType, String? ivKey}) {
    _encryptedValue = encryptedValue;
    _ivKey = ivKey ?? "";
  }
}
