import 'dart:math';

import 'package:flutter/services.dart';

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
    }

    if (includeDigits) {
      characterSet += _numericChars;
    }

    if (includeSymbols) {
      characterSet += _specialChars;
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

  String removeLetters(String input) {
    bool isLetter(String char) {
      final codeUnit = char.codeUnitAt(0);
      return (codeUnit >= 65 && codeUnit <= 90) ||
          (codeUnit >= 97 && codeUnit <= 122);
    }

    return input.split('').where((char) => !isLetter(char)).join();
  }

  String removeSpecialCharacters(String input) {
    String result = '';
    for (int i = 0; i < input.length; i++) {
      if (!_specialChars.contains(input[i])) {
        result += input[i];
      }
    }
    return result;
  }

  void copyToClipboard(String text) {
    // Copy the text to the clipboard
    Clipboard.setData(ClipboardData(text: text));

    // Optionally, show a toast or snackbar to indicate that the text has been copied
    // Example: ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Text copied to clipboard')));
  }
}
