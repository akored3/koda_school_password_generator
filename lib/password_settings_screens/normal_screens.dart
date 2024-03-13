import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:password_generator/constants.dart';
import 'package:password_generator/providers/password_provider.dart';
import 'package:password_generator/providers/slider_providers.dart';
import 'package:password_generator/providers/switch_providers.dart';
import 'package:password_generator/service/password_generator.dart';
import 'package:password_generator/utils/button.dart';
import 'package:password_generator/views/generated_password_view.dart';
import 'package:password_generator/widgets/character_settings.dart';

class NormalScreen extends ConsumerWidget {
  NormalScreen({super.key});
  String? password = 'Generate Password';
  PasswordGenerator passwordGenerator = PasswordGenerator();

  String passwordStrength = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    password = ref.watch(passwordProvider);

    Color firstSliderColor = ref.watch(firstSliderProvider);
    Color secondSliderColor = ref.watch(secondSliderProvider);
    Color thirdSliderColor = ref.watch(thirdSliderProvider);

    bool digitSwitchValue = ref.watch(digitSwitchProvider);
    bool characterSwitchValue = ref.watch(characterSwitchProvider);
    bool specialCharacterSwitchValue =
        ref.watch(specialCharacterSwitchProvider);

    String _passwordStrength() {
      if (firstSliderColor == grey &&
          secondSliderColor == grey &&
          thirdSliderColor == grey) {
        passwordStrength = 'Strength';
      } else if (firstSliderColor == redShade &&
          secondSliderColor == grey &&
          thirdSliderColor == grey) {
        passwordStrength = 'Weak';
      } else if (firstSliderColor == orangeShade &&
          secondSliderColor == orangeShade &&
          thirdSliderColor == grey) {
        passwordStrength = 'Medium';
      } else if (firstSliderColor == greenShade &&
          secondSliderColor == greenShade &&
          thirdSliderColor == greenShade) {
        passwordStrength = 'Strong';
      }
      return passwordStrength;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
        backgroundColor: white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: LayoutBuilder(builder: (context, constraints) {
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
                      borderRadius: BorderRadius.circular(10),
                      color: lightGreyShade),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Generate Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 70,
                              width: containerWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: grey,
                                    width: 0.25,
                                  )),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        password ?? '',
                                        style: TextStyle(
                                            color: grey, fontSize: 12),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.copy),
                                        color: grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              GestureDetector(
                                onHorizontalDragUpdate: (details) {
                                  if (details.primaryDelta! > 0) {
                                    ref
                                        .read(firstSliderProvider.notifier)
                                        .changeColor(redShade);
                                    ref
                                        .read(secondSliderProvider.notifier)
                                        .changeColor(grey);
                                    ref
                                        .read(thirdSliderProvider.notifier)
                                        .changeColor(grey);
                                    ref
                                        .read(passwordProvider.notifier)
                                        .showPassword(passwordGenerator
                                            .generateWeakPassword(
                                                includeDigits: digitSwitchValue,
                                                includeCharacters:
                                                    characterSwitchValue,
                                                includeSymbols:
                                                    specialCharacterSwitchValue));
                                  } else {
                                    ref
                                        .read(passwordProvider.notifier)
                                        .resetPassword();
                                    ref
                                        .read(firstSliderProvider.notifier)
                                        .resetColor(grey);
                                    ref
                                        .read(secondSliderProvider.notifier)
                                        .resetColor(grey);
                                    ref
                                        .read(thirdSliderProvider.notifier)
                                        .resetColor(grey);
                                  }
                                },
                                child: Container(
                                    height: 5,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: firstSliderColor,
                                    )),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              GestureDetector(
                                onHorizontalDragUpdate: (details) {
                                  if (details.primaryDelta! > 0) {
                                    ref
                                        .read(firstSliderProvider.notifier)
                                        .changeColor(orangeShade);
                                    ref
                                        .read(secondSliderProvider.notifier)
                                        .changeColor(orangeShade);
                                    ref
                                        .read(thirdSliderProvider.notifier)
                                        .changeColor(grey);
                                    ref
                                        .read(passwordProvider.notifier)
                                        .showPassword(passwordGenerator
                                            .generateMediumPassword(
                                                includeDigits: digitSwitchValue,
                                                includeCharacters:
                                                    characterSwitchValue,
                                                includeSymbols:
                                                    specialCharacterSwitchValue));
                                  } else {
                                    ref
                                        .read(passwordProvider.notifier)
                                        .showPassword(passwordGenerator
                                            .generateWeakPassword(
                                                includeDigits: digitSwitchValue,
                                                includeCharacters:
                                                    characterSwitchValue,
                                                includeSymbols:
                                                    specialCharacterSwitchValue));
                                    ref
                                        .read(thirdSliderProvider.notifier)
                                        .resetColor(grey);
                                    ref
                                        .read(secondSliderProvider.notifier)
                                        .resetColor(grey);
                                    ref
                                        .read(firstSliderProvider.notifier)
                                        .changeColor(redShade);
                                  }
                                },
                                child: Container(
                                    height: 5,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: secondSliderColor,
                                    )),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              GestureDetector(
                                onHorizontalDragUpdate: (details) {
                                  if (details.primaryDelta! > 0) {
                                    ref
                                        .read(firstSliderProvider.notifier)
                                        .changeColor(greenShade);
                                    ref
                                        .read(secondSliderProvider.notifier)
                                        .changeColor(greenShade);
                                    ref
                                        .read(thirdSliderProvider.notifier)
                                        .changeColor(greenShade);
                                    ref
                                        .read(passwordProvider.notifier)
                                        .showPassword(passwordGenerator
                                            .generateStrongPassword(
                                                includeDigits: digitSwitchValue,
                                                includeCharacters:
                                                    characterSwitchValue,
                                                includeSymbols:
                                                    specialCharacterSwitchValue));
                                  } else {
                                    ref
                                        .read(passwordProvider.notifier)
                                        .showPassword(passwordGenerator
                                            .generateMediumPassword(
                                                includeDigits: digitSwitchValue,
                                                includeCharacters:
                                                    characterSwitchValue,
                                                includeSymbols:
                                                    specialCharacterSwitchValue));
                                    ref
                                        .read(thirdSliderProvider.notifier)
                                        .resetColor(grey);
                                    ref
                                        .read(secondSliderProvider.notifier)
                                        .resetColor(orangeShade);
                                    ref
                                        .read(firstSliderProvider.notifier)
                                        .changeColor(orangeShade);
                                  }
                                },
                                child: Container(
                                    height: 5,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: thirdSliderColor,
                                    )),
                              )
                            ]),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(_passwordStrength())
                          ]))),
              const SizedBox(
                height: 15,
              ),
              //SETTINGS
              Container(
                height: containerHeight * 0.45,
                width: containerWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: lightGreyShade,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Settings',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                      CharacterSettings(
                          containerWidth: containerWidth,
                          containerHeight: 60,
                          label: 'Digits',
                          switchValue: digitSwitchValue,
                          turnOnSwitch: () {
                            final switchNotifier =
                                ref.watch(digitSwitchProvider.notifier);
                            switchNotifier.toggleDigitSwitch();
                          }),
                      CharacterSettings(
                          containerWidth: containerWidth,
                          containerHeight: 60,
                          label: 'Characters',
                          switchValue: characterSwitchValue,
                          turnOnSwitch: () {
                            final switchNotifier =
                                ref.watch(characterSwitchProvider.notifier);
                            switchNotifier.toggleCharacterSwitch();
                          }),
                      CharacterSettings(
                          containerWidth: containerWidth,
                          containerHeight: 60,
                          label: 'Symbols',
                          switchValue: specialCharacterSwitchValue,
                          turnOnSwitch: () {
                            final switchNotifier = ref
                                .watch(specialCharacterSwitchProvider.notifier);
                            switchNotifier.toggleSpecialCharacterSwitch();
                          }),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              BouncingButton(
                onTap: () {
                  if (firstSliderColor == grey &&
                      secondSliderColor == grey &&
                      thirdSliderColor == grey &&
                      password == ref.watch(passwordProvider)) {
                    password =
                        ref.watch(passwordProvider.notifier).tellToMoveSlider();
                  } else if (firstSliderColor == redShade &&
                      secondSliderColor == grey &&
                      thirdSliderColor == grey) {
                    password = ref.read(passwordProvider.notifier).showPassword(
                        passwordGenerator.generateWeakPassword(
                            includeDigits: digitSwitchValue,
                            includeCharacters: characterSwitchValue,
                            includeSymbols: specialCharacterSwitchValue));
                  } else if (firstSliderColor == orangeShade &&
                      secondSliderColor == orangeShade &&
                      thirdSliderColor == grey) {
                    password = ref.read(passwordProvider.notifier).showPassword(
                        passwordGenerator.generateMediumPassword(
                            includeDigits: digitSwitchValue,
                            includeCharacters: characterSwitchValue,
                            includeSymbols: specialCharacterSwitchValue));
                  } else if (firstSliderColor == greenShade &&
                      secondSliderColor == greenShade &&
                      thirdSliderColor == greenShade) {
                    password = ref.read(passwordProvider.notifier).showPassword(
                        passwordGenerator.generateStrongPassword(
                            includeDigits: digitSwitchValue,
                            includeCharacters: characterSwitchValue,
                            includeSymbols: specialCharacterSwitchValue));
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GeneratedPasswordView()));
                },
                text: 'Generate Password',
                color: Colors.purple,
                borderRadius: 10,
              )
            ],
          );
        }),
      ),
    );
  }
}
