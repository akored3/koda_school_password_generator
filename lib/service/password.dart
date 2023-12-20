import 'package:flutter/material.dart';

@immutable
class Password {
  final String value;

  const Password(this.value);

  @override
  String toString() {
    return value;
  }
}
