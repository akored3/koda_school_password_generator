import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:password_generator/constants.dart';
import 'package:password_generator/providers/password_provider.dart';

class NormalGeneratedPasswordScren extends ConsumerWidget {
  NormalGeneratedPasswordScren({super.key});

  String? generatedPassword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    generatedPassword = ref.watch(passwordProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
        title: const Text(
          'Generated Password',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // backgroundColor: white,
        shadowColor: Colors.black,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double containerWidth = constraints.maxWidth;
            double containerHeight = constraints.maxHeight;

            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: containerHeight * 0.30,
                  width: containerWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: blueShade,
                  ),
                  child: Center(
                    child: Text(
                      generatedPassword ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: white,
                          fontSize: 30),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
