import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:password_generator/constants.dart';
import 'package:password_generator/providers/password_provider.dart';
import 'package:password_generator/providers/slider_providers.dart';
import 'package:password_generator/providers/switch_providers.dart';
import 'package:password_generator/service/password_generator.dart';
import 'package:password_generator/widgets/bottom_menus.dart';
import 'package:password_generator/widgets/charater_settings.dart';

class NormalGeneratedPasswordScren extends ConsumerWidget {
  NormalGeneratedPasswordScren({super.key});
  PasswordGenerator passwordGenerator = PasswordGenerator();

  String? generatedPassword;
  // bool newDigitSwitchValue = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    generatedPassword = ref.watch(passwordProvider);

    Color firstSliderColor = ref.watch(firstSliderProvider);
    Color secondSliderColor = ref.watch(secondSliderProvider);
    Color thirdSliderColor = ref.watch(thirdSliderProvider);

    bool digitSwitchValue = ref.watch(digitSwitchProvider);
    bool characterSwitchValue = ref.watch(characterSwitchProvider);
    bool specialCharacterSwitchValue =
        ref.watch(specialCharacterSwitchProvider);

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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double containerWidth = constraints.maxWidth;
            double containerHeight = constraints.maxHeight;

            return Column(
              children: [
                // const SizedBox(
                //   height: 5,
                // ),
                Container(
                  height: containerHeight * 0.30,
                  width: containerWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: blueShade,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Text(
                        generatedPassword ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: white,
                            fontSize: 25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                            ref.read(passwordProvider.notifier).showPassword(
                                passwordGenerator.generateWeakPassword(
                                    includeDigits: digitSwitchValue,
                                    includeCharacters: characterSwitchValue,
                                    includeSymbols:
                                        specialCharacterSwitchValue));
                          } else {
                            ref.read(passwordProvider.notifier).resetPassword();
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
                            width: 113,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: firstSliderColor,
                            )),
                      ),
                      const SizedBox(
                        width: 5,
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
                            ref.read(passwordProvider.notifier).showPassword(
                                passwordGenerator.generateMediumPassword(
                                    includeDigits: digitSwitchValue,
                                    includeCharacters: characterSwitchValue,
                                    includeSymbols:
                                        specialCharacterSwitchValue));
                          } else {
                            ref.read(passwordProvider.notifier).showPassword(
                                passwordGenerator.generateWeakPassword(
                                    includeDigits: digitSwitchValue,
                                    includeCharacters: characterSwitchValue,
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
                            width: 113,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: secondSliderColor,
                            )),
                      ),
                      const SizedBox(
                        width: 5,
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
                            ref.read(passwordProvider.notifier).showPassword(
                                passwordGenerator.generateStrongPassword(
                                    includeDigits: digitSwitchValue,
                                    includeCharacters: characterSwitchValue,
                                    includeSymbols:
                                        specialCharacterSwitchValue));
                          } else {
                            ref.read(passwordProvider.notifier).showPassword(
                                passwordGenerator.generateMediumPassword(
                                    includeDigits: digitSwitchValue,
                                    includeCharacters: characterSwitchValue,
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
                            width: 113,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: thirdSliderColor,
                            )),
                      )
                    ]),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CharacterSettingsPartTwo(
                      containerHeight: 130,
                      containerWidth: containerWidth * 0.48,
                      containerColor: digitSwitchValue ? blueShade : white,
                      innerContainerWidth: 70,
                      innerContainerHeight: 45,
                      innerContainerColor:
                          digitSwitchValue ? deepBlueShade : grey,
                      innerContainerText: '123',
                      characterName: Text(
                        'Digits',
                        style: TextStyle(
                          color: digitSwitchValue ? white : grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      switchValue: digitSwitchValue,
                      turnOnSwitch: (newSwitchValue) {
                        newSwitchValue = digitSwitchValue;
                        if (newSwitchValue != false) {
                          final switchNotifier =
                              ref.watch(digitSwitchProvider.notifier);
                          switchNotifier.toggleDigitSwitchAgain();
                          ref.read(passwordProvider.notifier).removeDigit(
                              passwordGenerator
                                  .removeDigits(generatedPassword ?? ''));
                        } else {
                          final switchNotifier =
                              ref.watch(digitSwitchProvider.notifier);
                          switchNotifier.toggleDigitSwitch();
                        }
                      },
                    ),
                    CharacterSettingsPartTwo(
                      containerHeight: 130,
                      containerWidth: containerWidth * 0.48,
                      containerColor: characterSwitchValue ? blueShade : white,
                      innerContainerWidth: 70,
                      innerContainerHeight: 45,
                      innerContainerColor:
                          characterSwitchValue ? deepBlueShade : grey,
                      innerContainerText: 'ABC',
                      characterName: Text(
                        'Characters',
                        style: TextStyle(
                          color: characterSwitchValue ? white : grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      switchValue: characterSwitchValue,
                      turnOnSwitch: (newSwitchValue) {
                        newSwitchValue = characterSwitchValue;
                        if (newSwitchValue != false) {
                          final switchNotifier =
                              ref.watch(characterSwitchProvider.notifier);
                          switchNotifier.toggleCharacterSwitchAgain();
                          ref.read(passwordProvider.notifier).removeCharacters(
                              passwordGenerator
                                  .removeLetters(generatedPassword ?? ''));
                        } else {
                          final switchNotifier =
                              ref.watch(characterSwitchProvider.notifier);
                          switchNotifier.toggleCharacterSwitch();
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CharacterSettingsPartTwo(
                      containerHeight: 130,
                      containerWidth: containerWidth * 0.48,
                      containerColor:
                          specialCharacterSwitchValue ? blueShade : white,
                      innerContainerWidth: 70,
                      innerContainerHeight: 45,
                      innerContainerColor:
                          specialCharacterSwitchValue ? deepBlueShade : grey,
                      innerContainerText: '@#!',
                      characterName: Text(
                        'Symbols',
                        style: TextStyle(
                          color: specialCharacterSwitchValue ? white : grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      switchValue: specialCharacterSwitchValue,
                      turnOnSwitch: (newSwitchValue) {
                        newSwitchValue = specialCharacterSwitchValue;
                        if (newSwitchValue != false) {
                          final switchNotifier = ref
                              .watch(specialCharacterSwitchProvider.notifier);
                          switchNotifier.toggleSpecialCharacterSwitchAgain();
                        } else {
                          final switchNotifier = ref
                              .watch(specialCharacterSwitchProvider.notifier);
                          switchNotifier.toggleSpecialCharacterSwitch();
                        }
                      },
                    ),
                    const SizedBox(
                      width: 48,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomMenu(
                        containerWidth: 55,
                        containerHeight: 55,
                        borderRadius: 30,
                        menuName: 'Copy',
                        icon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.copy_rounded,
                            color: white,
                          ),
                        ),
                      ),
                      BottomMenu(
                        containerWidth: 75,
                        containerHeight: 75,
                        borderRadius: 45,
                        menuName: 'Generate',
                        icon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.auto_fix_high_rounded,
                            color: white,
                            size: 35,
                          ),
                        ),
                      ),
                      BottomMenu(
                        containerWidth: 55,
                        containerHeight: 55,
                        borderRadius: 30,
                        menuName: 'Back',
                        icon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.replay,
                            color: white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
