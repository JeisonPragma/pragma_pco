class TextValidators {
  static String? addressWebValidator(String? value, {bool makeStrong = false}) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu dirección web';
    }
    if (_validNumber(value.substring(0, 1))) {
      return 'No puede empezar con números';
    }
    if (makeStrong && !_validAddressWeb(value.replaceAll(RegExp(r'\s+\b|\b\s'), ''))) {
      return 'Sin caractéres especiales';
    }
    return null;
  }

  static bool _validNumber(String value) {
    const String pattern = '[0-9]';
    final RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  static bool _validAddressWeb(String value) {
    const String pattern = r'^[A-Za-z0-9_]+$';
    final RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }
}