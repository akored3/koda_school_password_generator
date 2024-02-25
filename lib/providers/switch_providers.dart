import 'package:hooks_riverpod/hooks_riverpod.dart';

class DigitSwitch extends StateNotifier<bool> {
  DigitSwitch() : super(false);

  bool toggleDigitSwitch() => state = !state;
}

class CharacterSwitch extends StateNotifier<bool> {
  CharacterSwitch() : super(false);

  bool toggleCharacterSwitch() => state = !state;
}

class SpecialCharacterSwitch extends StateNotifier<bool> {
  SpecialCharacterSwitch() : super(false);

  bool toggleSpecialCharacterSwitch() => state = !state;
}

final digitSwitchProvider =
    StateNotifierProvider<DigitSwitch, bool>((ref) => DigitSwitch());

final characterSwitchProvider =
    StateNotifierProvider<CharacterSwitch, bool>((ref) => CharacterSwitch());

final specialCharacterSwitchProvider =
    StateNotifierProvider<SpecialCharacterSwitch, bool>(
        (ref) => SpecialCharacterSwitch());
