import 'package:flutter/material.dart';
import 'package:password_generator/constants.dart';
import 'package:password_generator/password_settings_screen/riverpod_normal_screen.dart';
import 'package:password_generator/utils/button.dart';
import 'package:password_generator/utils/dummy_indicators.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/bubble-gum-woman-enters-the-password-from-her-account.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const DummyIndicators(),
            const SizedBox(height: 20),
            BouncingButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RiverpodNormalScreen()));
              },
              text: 'Continue',
              color: blueShade,
              borderRadius: 25,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
