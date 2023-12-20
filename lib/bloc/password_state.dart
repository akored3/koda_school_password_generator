import 'package:flutter/foundation.dart';

@immutable
abstract class PasswordGeneratorState {
  const PasswordGeneratorState();
}

class PasswordGeneratorInitialState extends PasswordGeneratorState {
  const PasswordGeneratorInitialState();
}

class PasswordGeneratorOnState extends PasswordGeneratorState {
  const PasswordGeneratorOnState();
}

class ColdPasswordState extends PasswordGeneratorState {
  const ColdPasswordState();
}

class WarmPasswordState extends PasswordGeneratorState {
  const WarmPasswordState();
}

class HotPasswordState extends PasswordGeneratorState {
  const HotPasswordState();
}

class GeneratedPasswordState extends PasswordGeneratorState {
  const GeneratedPasswordState();
}
