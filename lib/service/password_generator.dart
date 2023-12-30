import 'dart:math';

class PasswordGenerator {
  //include a function that removes digits from a string that has digits
  static const _lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
  static const _uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const _numericChars = '0123456789';
  static const _specialChars = '!@#\$%^&*()-_=+[]{}|;:,.<>?';

  String generateWeakPassword({
    int length = 8,
  }) {
    return _generatePassword(length, _lowercaseChars).toString();
  }

  String generateMediumPassword({
    int length = 12,
  }) {
    return _generatePassword(
      length,
      _lowercaseChars + _uppercaseChars,
    ).toString();
  }

  String generateStrongPassword({
    int length = 16,
  }) {
    return _generatePassword(
      length,
      _lowercaseChars + _uppercaseChars + _numericChars + _specialChars,
    ).toString();
  }

  String _generatePassword(int length, String characterSet) {
    final random = Random();
    final password = StringBuffer();

    for (int i = 0; i < length; i++) {
      final index = random.nextInt(characterSet.length);
      password.write(characterSet[index]);
    }
    return password.toString();
  }
}
