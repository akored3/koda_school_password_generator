import 'package:flutter/cupertino.dart';
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
