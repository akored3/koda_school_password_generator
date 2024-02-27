import 'package:flutter/material.dart';
import 'package:password_generator/password_settings_screens/normal_screens.dart';
import 'package:password_generator/password_settings_screens/small_screens.dart';

class PasswordGeneratorView extends StatelessWidget {
  const PasswordGeneratorView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxHeight < 600) {
          return SmallScreen();
        } else {
          return NormalScreen();
        }
      },
    );
  }
}
