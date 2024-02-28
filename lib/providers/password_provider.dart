import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordProvider extends StateNotifier<String?> {
  PasswordProvider() : super('Generate Password....');
  String showPassword(String newText) {
    return state = newText;
  }

  void resetPassword() {
    state = 'Generate password....';
  }

  String tellToMoveSlider() {
    return state = 'move the slider to generate a password😒';
  }
}

final passwordProvider = StateNotifierProvider<PasswordProvider, String?>(
    (ref) => PasswordProvider());
