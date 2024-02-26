import 'package:flutter/material.dart';
import 'package:password_generator/constants.dart';
import 'package:password_generator/utils/button.dart';

class SmallScreen extends StatefulWidget {
  const SmallScreen({super.key});

  @override
  State<SmallScreen> createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
                height: containerHeight * 0.25,
                width: containerWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: lightGreyShade,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 15,
                  ),
                  child: Container(
                    color: Colors.blue,
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
                height: 40,
              ),
              BouncingButton(
                onTap: () {},
                text: 'Generate Password',
                color: purple,
                borderRadius: 10,
              )
            ],
          );
        }),
      ),
    );
  }
}
