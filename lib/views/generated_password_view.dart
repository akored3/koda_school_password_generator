import 'package:flutter/material.dart';
import 'package:password_generator/generated_password_screens/normal_generated_password_screen.dart';
import 'package:password_generator/generated_password_screens/small_generated_password_screen.dart';

class GeneratedPasswordView extends StatelessWidget {
  const GeneratedPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxHeight < 600) {
          return const SmallGeneratedPasswordScreen();
        } else {
          return NormalGeneratedPasswordScren();
        }
      },
    );
  }
}
