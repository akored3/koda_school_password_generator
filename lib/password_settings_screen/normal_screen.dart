import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/bloc/password_bloc.dart';
import 'package:password_generator/bloc/password_event.dart';
import 'package:password_generator/constants.dart';
import 'package:password_generator/utils/button.dart';

class NormalScreen extends StatefulWidget {
  const NormalScreen({super.key});

  @override
  State<NormalScreen> createState() => _NormalScreenState();
}

class _NormalScreenState extends State<NormalScreen> {
  //List of colors
  List<Color> sliderColors = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];

  String passwordStrength = '';

  String _passwordStrength() {
    if (sliderColors[0] == Colors.grey &&
        sliderColors[1] == Colors.grey &&
        sliderColors[2] == Colors.grey) {
      passwordStrength = 'Strength';
    } else if (sliderColors[0] == redShade &&
        sliderColors[1] == Colors.grey &&
        sliderColors[2] == Colors.grey) {
      passwordStrength = 'Weak';
    } else if (sliderColors[0] == orangeShade &&
        sliderColors[1] == orangeShade &&
        sliderColors[2] == Colors.grey) {
      passwordStrength = 'Medium';
    } else if (sliderColors[0] == greenShade &&
        sliderColors[1] == greenShade &&
        sliderColors[2] == greenShade) {
      passwordStrength = 'Strength';
    }
    return passwordStrength;
  }

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
        backgroundColor: Colors.white,
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
                height: containerHeight * 0.35,
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
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              if (details.primaryDelta! > 0) {
                                setState(() {
                                  sliderColors[0] = redShade;
                                  sliderColors[1] = Colors.grey;
                                  sliderColors[2] = Colors.grey;
                                });
                              } else {
                                setState(() {
                                  sliderColors[0] = Colors.grey;
                                  sliderColors[1] = Colors.grey;
                                  sliderColors[2] = Colors.grey;
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
                              if (details.primaryDelta! > 0) {
                                setState(() {
                                  sliderColors[0] = orangeShade;
                                  sliderColors[1] = orangeShade;
                                  sliderColors[2] = Colors.grey;
                                });
                              } else {
                                setState(() {
                                  sliderColors[0] = redShade;
                                  sliderColors[1] = Colors.grey;
                                  sliderColors[2] = Colors.grey;
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
                              if (details.primaryDelta! > 0) {
                                setState(() {
                                  sliderColors[0] = greenShade;
                                  sliderColors[1] = greenShade;
                                  sliderColors[2] = greenShade;
                                });
                              } else {
                                setState(() {
                                  sliderColors[0] = orangeShade;
                                  sliderColors[1] = orangeShade;
                                  sliderColors[2] = Colors.grey;
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
              Container(
                height: containerHeight * 0.40,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: lightGreyShade,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              BouncingButton(
                onTap: () {},
                text: 'Generate Password',
              )
            ],
          );
        }),
      ),
    );
  }
}
