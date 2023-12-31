import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/bloc/password_bloc.dart';
import 'package:password_generator/bloc/password_event.dart';
import 'package:password_generator/constants.dart';
import 'package:password_generator/service/password_generator.dart';
import 'package:password_generator/utils/button.dart';
import 'package:password_generator/widgets/charater_settings.dart';

class NormalScreen extends StatefulWidget {
  const NormalScreen({super.key});

  @override
  State<NormalScreen> createState() => _NormalScreenState();
}

class _NormalScreenState extends State<NormalScreen> {
  late String password = 'Generated password.....';

  late PasswordGenerator passwordGenerator;

  @override
  void initState() {
    passwordGenerator = PasswordGenerator();
    super.initState();
  }

  //List of colors
  List<Color> sliderColors = [
    grey,
    grey,
    grey,
  ];

  String passwordStrength = '';

  String _passwordStrength() {
    if (sliderColors[0] == grey &&
        sliderColors[1] == grey &&
        sliderColors[2] == grey) {
      passwordStrength = 'Strength';
    } else if (sliderColors[0] == redShade &&
        sliderColors[1] == grey &&
        sliderColors[2] == grey) {
      passwordStrength = 'Weak';
    } else if (sliderColors[0] == orangeShade &&
        sliderColors[1] == orangeShade &&
        sliderColors[2] == grey) {
      passwordStrength = 'Medium';
    } else if (sliderColors[0] == greenShade &&
        sliderColors[1] == greenShade &&
        sliderColors[2] == greenShade) {
      passwordStrength = 'Strong';
    }
    return passwordStrength;
  }

  List<bool> switchValues = [false, false, false];
  bool get includeDigits => switchValues[0];
  bool get includeSymbols => switchValues[2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<PasswordGeneratorBloc>().add(const EventInitial());
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
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
                  color: lightGreyShade,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Generated Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 75,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: grey,
                            width: 0.25,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  password,
                                  style: TextStyle(color: grey, fontSize: 12),
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
                        height: 25,
                      ),
                      //SLIDER
                      Row(
                        children: [
                          GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              String generatedPassword;

                              if (details.primaryDelta! > 0) {
                                generatedPassword =
                                    passwordGenerator.generateWeakPassword(
                                  includeDigits: switchValues[0],
                                  includeCharacters: switchValues[1],
                                  includeSymbols: switchValues[2],
                                );
                                setState(() {
                                  sliderColors[0] = redShade;
                                  sliderColors[1] = grey;
                                  sliderColors[2] = grey;
                                  password = generatedPassword;
                                });
                              } else {
                                setState(() {
                                  sliderColors[0] = grey;
                                  sliderColors[1] = grey;
                                  sliderColors[2] = grey;
                                  password = 'Generated password.....';
                                });
                              }
                            },
                            child: Container(
                              height: 5,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: sliderColors[0],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              String generatedPassword;
                              if (details.primaryDelta! > 0) {
                                generatedPassword =
                                    passwordGenerator.generateMediumPassword(
                                  includeDigits: switchValues[0],
                                  includeCharacters: switchValues[1],
                                  includeSymbols: switchValues[2],
                                );
                                setState(() {
                                  sliderColors[0] = orangeShade;
                                  sliderColors[1] = orangeShade;
                                  sliderColors[2] = grey;
                                  password = generatedPassword;
                                });
                              } else {
                                setState(() {
                                  sliderColors[0] = redShade;
                                  sliderColors[1] = grey;
                                  sliderColors[2] = grey;
                                  password =
                                      passwordGenerator.generateWeakPassword(
                                    includeDigits: switchValues[0],
                                    includeCharacters: switchValues[1],
                                    includeSymbols: switchValues[2],
                                  );
                                });
                              }
                            },
                            child: Container(
                              height: 5,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: sliderColors[1],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              String generatedPassword =
                                  passwordGenerator.generateStrongPassword(
                                includeDigits: switchValues[0],
                                includeCharacters: switchValues[1],
                                includeSymbols: switchValues[2],
                              );
                              if (details.primaryDelta! > 0) {
                                setState(() {
                                  sliderColors[0] = greenShade;
                                  sliderColors[1] = greenShade;
                                  sliderColors[2] = greenShade;
                                  password = generatedPassword;
                                });
                              } else {
                                setState(() {
                                  sliderColors[0] = orangeShade;
                                  sliderColors[1] = orangeShade;
                                  sliderColors[2] = grey;
                                  password =
                                      passwordGenerator.generateMediumPassword(
                                    includeDigits: switchValues[0],
                                    includeCharacters: switchValues[1],
                                    includeSymbols: switchValues[2],
                                  );
                                });
                              }
                            },
                            child: Container(
                              height: 5,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: sliderColors[2],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        _passwordStrength(),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //SETTINGS
              Container(
                height: containerHeight * 0.40,
                width: 400,
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
                      const Text(
                        'Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      CharacterSettings(
                          containerWidth: containerWidth,
                          containerHeight: 60,
                          label: 'Digits',
                          switchValue: switchValues[0],
                          onSwitchChanged: (bool value) {
                            setState(() {
                              switchValues[0] = value;
                            });
                          }),
                      CharacterSettings(
                          containerWidth: containerWidth,
                          containerHeight: 60,
                          label: 'Characters',
                          switchValue: switchValues[1],
                          onSwitchChanged: (bool value) {
                            setState(() {
                              switchValues[1] = value;
                            });
                          }),
                      CharacterSettings(
                          containerWidth: containerWidth,
                          containerHeight: 60,
                          label: 'Symbols',
                          switchValue: switchValues[2],
                          onSwitchChanged: (bool value) {
                            setState(() {
                              switchValues[2] = value;
                            });
                          }),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              BouncingButton(
                onTap: () {
                  String generatedPassword;
                  if (sliderColors[0] == redShade &&
                      sliderColors[1] == grey &&
                      sliderColors[2] == grey) {
                    generatedPassword = passwordGenerator.generateWeakPassword(
                      includeDigits: switchValues[0],
                      includeCharacters: switchValues[1],
                      includeSymbols: switchValues[2],
                    );
                    setState(() {
                      password = generatedPassword;
                    });
                  } else if (sliderColors[0] == orangeShade &&
                      sliderColors[1] == orangeShade &&
                      sliderColors[2] == grey) {
                    generatedPassword =
                        passwordGenerator.generateMediumPassword(
                      includeDigits: switchValues[0],
                      includeSymbols: switchValues[0],
                    );
                    setState(() {
                      password = generatedPassword;
                    });
                  } else if (sliderColors[0] == greenShade &&
                      sliderColors[1] == greenShade &&
                      sliderColors[2] == greenShade) {
                    generatedPassword =
                        passwordGenerator.generateStrongPassword(
                      includeDigits: switchValues[0],
                      includeSymbols: switchValues[2],
                    );
                    setState(() {
                      password = generatedPassword;
                    });
                  }
                },
                text: 'Generate Password',
              ),
            ],
          );
        }),
      ),
    );
  }
}
