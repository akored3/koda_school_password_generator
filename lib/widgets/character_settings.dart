import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_generator/constants.dart';

class CharacterSettings extends StatelessWidget {
  const CharacterSettings(
      {super.key,
      required this.containerWidth,
      required this.containerHeight,
      required this.label,
      required this.switchValue,
      required this.turnOnSwitch});

  final double containerWidth;
  final double containerHeight;
  final String label;
  final bool switchValue;
  final Function turnOnSwitch;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            CupertinoSwitch(
                value: switchValue,
                activeColor: purple,
                onChanged: (value) {
                  turnOnSwitch();
                })
          ],
        ),
      ),
    );
  }
}

class GeneratedCharacterSettings extends StatelessWidget {
  const GeneratedCharacterSettings(
      {super.key,
      required this.containerWidth,
      required this.containerHeight,
      required this.innerContainerWidth,
      required this.innerContainerHeight,
      required this.containerColor,
      required this.innerContainerColor,
      required this.innerContainerText,
      required this.characterName,
      required this.switchValue,
      required this.turnOnSwitch,
      required this.containerPadding,
      required this.containerHeightSpace,
      required this.containerWidthSpace});

  final double containerWidth;
  final double containerHeight;
  final double innerContainerWidth;
  final double innerContainerHeight;
  final Color containerColor;
  final Color innerContainerColor;
  final Widget characterName;
  final Widget innerContainerText;
  final bool switchValue;
  final Function(bool) turnOnSwitch;
  final double containerPadding;
  final double containerHeightSpace;
  final double containerWidthSpace;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: grey,
          width: 0.35,
        ),
      ),
      width: containerWidth,
      height: containerHeight,
      child: Padding(
        padding: EdgeInsets.only(top: containerPadding, left: containerPadding),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: innerContainerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: innerContainerWidth,
                  height: innerContainerHeight,
                  child: Center(
                    child: innerContainerText,
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            SizedBox(
              height: containerHeightSpace,
            ),
            Row(
              children: [
                characterName,
                SizedBox(
                  width: containerWidthSpace,
                ),
                Transform.scale(
                  scale: 0.45,
                  child: CupertinoSwitch(
                      value: switchValue,
                      activeColor: deepBlueShade,
                      onChanged: (value) {
                        turnOnSwitch(value);
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
