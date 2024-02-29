import 'dart:math';

class PasswordGenerator {
  static const _lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
  static const _uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const _numericChars = '0123456789';
  static const _specialChars = '!@#\$%^&*()-_=+[]{}|;:,.<>?';

  String generateWeakPassword(
      {int length = 8,
      bool includeDigits = false,
      bool includeSymbols = false,
      bool includeCharacters = false}) {
    return _generatePassword(
      length,
      '',
      includeDigits,
      includeSymbols,
      includeCharacters,
    ).toString();
  }

  String generateMediumPassword({
    int length = 12,
    bool includeDigits = false,
    bool includeSymbols = false,
    bool includeCharacters = false,
  }) {
    return _generatePassword(
      length,
      '',
      includeDigits,
      includeSymbols,
      includeCharacters,
    ).toString();
  }

  String generateStrongPassword({
    int length = 16,
    bool includeDigits = false,
    bool includeSymbols = false,
    bool includeCharacters = false,
  }) {
    return _generatePassword(
      length,
      '',
      includeDigits,
      includeSymbols,
      includeCharacters,
    ).toString();
  }

  String _generatePassword(
    int length,
    String characterSet,
    bool includeDigits,
    bool includeSymbols,
    bool includeCharacters,
  ) {
    final random = Random();
    final password = StringBuffer();

    if (includeCharacters) {
      characterSet += _lowercaseChars + _uppercaseChars;
    } else if (!includeCharacters) {
      characterSet =
          characterSet.replaceAll(_lowercaseChars + _uppercaseChars, '');
    }

    if (includeDigits) {
      characterSet += _numericChars;
    } else if (!includeDigits) {
      characterSet = characterSet.replaceAll(_numericChars, '');
    }

    if (includeSymbols) {
      characterSet += _specialChars;
    } else if (!includeSymbols) {
      characterSet = characterSet.replaceAll(_specialChars, '');
    }

    for (int i = 0; i < length; i++) {
      if (characterSet == '') {
        return 'No settings turned on';
      } else {
        final index = random.nextInt(characterSet.length);
        password.write(characterSet[index]);
      }
    }
    return password.toString();
  }

  String removeDigits(String input) {
    bool isDigit(String char) {
      final codeUnit = char.codeUnitAt(0);
      return codeUnit >= 48 && codeUnit <= 57;
    }

    return input.split('').where((char) => !isDigit(char)).join();
  }
}
