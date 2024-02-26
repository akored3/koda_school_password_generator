import 'package:flutter/material.dart';
import 'package:password_generator/password_settings_screen/riverpod_normal_screen.dart';
import 'package:password_generator/password_settings_screen/small_screens.dart';

class PasswordGeneratorView extends StatefulWidget {
  const PasswordGeneratorView({super.key});

  @override
  State<PasswordGeneratorView> createState() => _PasswordGeneratorViewState();
}

class _PasswordGeneratorViewState extends State<PasswordGeneratorView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxHeight < 600) {
          return const SmallScreen();
        } else {
          return RiverpodNormalScreen();
        }
      },
    );
  }
}
