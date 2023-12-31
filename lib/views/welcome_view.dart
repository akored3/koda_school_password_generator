import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/bloc/password_bloc.dart';
import 'package:password_generator/bloc/password_event.dart';
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
                context
                    .read<PasswordGeneratorBloc>()
                    .add(const EventStartPasswordGenerator());
              },
              text: 'Continue',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
