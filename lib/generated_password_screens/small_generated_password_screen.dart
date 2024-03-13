import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:password_generator/constants.dart';
import 'package:password_generator/providers/password_provider.dart';
import 'package:password_generator/providers/slider_providers.dart';
import 'package:password_generator/providers/switch_providers.dart';
import 'package:password_generator/service/password_generator.dart';
import 'package:password_generator/widgets/bottom_menus.dart';
import 'package:password_generator/widgets/character_settings.dart';

class SmallGeneratedPasswordScreen extends ConsumerWidget {
  SmallGeneratedPasswordScreen({super.key});

  PasswordGenerator passwordGenerator = PasswordGenerator();

  String? generatedPassword;

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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double containerWidth = constraints.maxWidth;
            double containerHeight = constraints.maxHeight;

            return Column(
              children: [
                Container(
                  height: containerHeight * 0.3,
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
                  height: 5,
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
                            width: 90,
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
                            width: 90,
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
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: thirdSliderColor,
                            )),
                      )
                    ]),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CharacterSettingsPartTwo(
                      containerHeight: 90,
                      containerWidth: containerWidth * 0.49,
                      containerPadding: 5.0,
                      containerHeightSpace: 15.0,
                      containerWidthSpace: 48,
                      containerColor: digitSwitchValue ? blueShade : white,
                      innerContainerWidth: 50,
                      innerContainerHeight: 30,
                      innerContainerColor:
                          digitSwitchValue ? deepBlueShade : grey,
                      innerContainerText: const Text(
                        '123',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      characterName: Text(
                        'Digits',
                        style: TextStyle(
                          color: digitSwitchValue ? white : grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
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
                      containerHeight: 90,
                      containerWidth: containerWidth * 0.49,
                      containerPadding: 5.0,
                      containerHeightSpace: 15.0,
                      containerWidthSpace: 25,
                      containerColor: characterSwitchValue ? blueShade : white,
                      innerContainerWidth: 50,
                      innerContainerHeight: 30,
                      innerContainerColor:
                          characterSwitchValue ? deepBlueShade : grey,
                      innerContainerText: const Text(
                        'Abc',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      characterName: Text(
                        'Characters',
                        style: TextStyle(
                          color: characterSwitchValue ? white : grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
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
                      containerHeight: 90,
                      containerWidth: containerWidth * 0.49,
                      containerPadding: 5.0,
                      containerHeightSpace: 15,
                      containerWidthSpace: 35,
                      containerColor:
                          specialCharacterSwitchValue ? blueShade : white,
                      innerContainerWidth: 50,
                      innerContainerHeight: 30,
                      innerContainerColor:
                          specialCharacterSwitchValue ? deepBlueShade : grey,
                      innerContainerText: const Text(
                        '@#!',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      characterName: Text(
                        'Symbols',
                        style: TextStyle(
                          color: specialCharacterSwitchValue ? white : grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
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
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomMenu(
                      containerWidth: 35,
                      containerHeight: 35,
                      borderRadius: 35,
                      icon: IconButton(
                        onPressed: () {
                          passwordGenerator
                              .copyToClipboard(generatedPassword ?? '');
                        },
                        icon: Icon(
                          Icons.copy_rounded,
                          color: white,
                        ),
                      ),
                    ),
                    BottomMenu(
                      containerWidth: 50,
                      containerHeight: 50,
                      borderRadius: 45,
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
                      containerWidth: 35,
                      containerHeight: 35,
                      borderRadius: 35,
                      icon: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.replay,
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 1,
                    ),
                    Text('Copy'),
                    SizedBox(
                      width: 0.5,
                    ),
                    Text('Generate'),
                    SizedBox(
                      width: 0.5,
                    ),
                    Text('Back'),
                    SizedBox(
                      width: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
