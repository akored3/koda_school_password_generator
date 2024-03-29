import 'package:hooks_riverpod/hooks_riverpod.dart';

class DigitSwitch extends StateNotifier<bool> {
  DigitSwitch() : super(false);

  bool toggleDigitSwitch() => state = !state;

  bool toggleDigitSwitchAgain() => state = false;
}

class CharacterSwitch extends StateNotifier<bool> {
  CharacterSwitch() : super(false);

  bool toggleCharacterSwitch() => state = !state;

  bool toggleCharacterSwitchAgain() => state = false;
}

class SpecialCharacterSwitch extends StateNotifier<bool> {
  SpecialCharacterSwitch() : super(false);

  bool toggleSpecialCharacterSwitch() => state = !state;

  bool toggleSpecialCharacterSwitchAgain() => state = false;
}

final digitSwitchProvider =
    StateNotifierProvider<DigitSwitch, bool>((ref) => DigitSwitch());

final characterSwitchProvider =
    StateNotifierProvider<CharacterSwitch, bool>((ref) => CharacterSwitch());

final specialCharacterSwitchProvider =
    StateNotifierProvider<SpecialCharacterSwitch, bool>(
        (ref) => SpecialCharacterSwitch());
