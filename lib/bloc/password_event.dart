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

class EventGenerateColdPassword extends PasswordEvent {
  const EventGenerateColdPassword();
}

class EventGenerateWarmPassword extends PasswordEvent {
  const EventGenerateWarmPassword();
}

class EventGenerateHotPassword extends PasswordEvent {
  const EventGenerateHotPassword();
}
