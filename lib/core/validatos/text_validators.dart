class TextValidators {
  static String? addressWebValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu dirección web';
    }
    if (_validNumber(value.substring(0, 1))) {
      return 'No puede empezar con números';
    }
    if (!_validAddressWeb(value)) {
      return 'No es una url válida';
    }
    return null;
  }

  static bool _validNumber(String value) {
    const String pattern = '[0-9]';
    final RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  static bool _validAddressWeb(String value) {
    final RegExp urlRegex = RegExp(
        r'^(?:http|https):\/\/[\w\-_]+(?:\.[\w\-_]+)+[\w\-.,@?^=%&:/~+#]*[\w\-@?^=%&/~+#]$');
    return urlRegex.hasMatch(value);
  }
}