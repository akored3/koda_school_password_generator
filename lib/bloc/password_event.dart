import 'package:flutter/foundation.dart';

@immutable
abstract class PasswordEvent {
  const PasswordEvent();
}

class EventInitial extends PasswordEvent {
  const EventInitial();
}

class EventStartPasswordGenerator extends PasswordEvent {
  const EventStartPasswordGenerator();
}

class EventGenerateWeakPassword extends PasswordEvent {
  const EventGenerateWeakPassword();
}

class EventGenerateMediumPassword extends PasswordEvent {
  const EventGenerateMediumPassword();
}

class EventGenerateStrongPassword extends PasswordEvent {
  const EventGenerateStrongPassword();
}
