import 'package:flutter/material.dart';
import 'package:password_generator/service/password_generator.dart';
import 'package:password_generator/utils/button.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({super.key});

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  late PasswordGenerator passwordGenerator;
  late String password = '';

  @override
  void initState() {
    passwordGenerator = PasswordGenerator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    password,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonImageFb1(
                onPressed: () {
                  String generatedPassword =
                      passwordGenerator.generateWeakPassword();
                  setState(() {
                    password = generatedPassword;
                  });
                },
                text: 'Generate',
              )
            ],
          ),
        ),
      ),
    );
  }
}
