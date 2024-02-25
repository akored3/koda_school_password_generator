import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordProvider extends StateNotifier<String?> {
  PasswordProvider() : super('Generate Password....');
  void showPassword(String? newText) {
    state = newText;
  }

  void resetPassword() {
    state = 'Generate password....';
  }
}

final passwordProvider = StateNotifierProvider<PasswordProvider, String?>(
    (ref) => PasswordProvider());
