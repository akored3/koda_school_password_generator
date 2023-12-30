import 'dart:math';

class PasswordGenerator {
  static const _lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
  static const _uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const _numericChars = '0123456789';
  static const _specialChars = '!@#\$%^&*()-_=+[]{}|;:,.<>?';

  String generateWeakPassword({
    int length = 8,
    bool includeDigits = false,
  }) {
    return _generatePassword(
      length,
      _lowercaseChars,
      includeDigits,
    ).toString();
  }

  String generateMediumPassword({
    int length = 12,
    bool includeDigits = false,
  }) {
    return _generatePassword(
      length,
      _lowercaseChars + _uppercaseChars,
      includeDigits,
    ).toString();
  }

  String generateStrongPassword({
    int length = 16,
    bool includeDigits = false,
  }) {
    return _generatePassword(
      length,
      _lowercaseChars + _uppercaseChars + _numericChars + _specialChars,
      includeDigits,
    ).toString();
  }

  String _generatePassword(
    int length,
    String characterSet,
    bool includeDigits,
  ) {
    final random = Random();
    final password = StringBuffer();

    if (includeDigits) {
      characterSet += _numericChars;
    }

    for (int i = 0; i < length; i++) {
      final index = random.nextInt(characterSet.length);
      password.write(characterSet[index]);
    }
    return password.toString();
  }
}
