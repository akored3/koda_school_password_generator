import 'package:flutter/cupertino.dart';
import 'package:password_generator/constants.dart';

class CharacterSettings extends StatefulWidget {
  final double containerWidth;
  final double containerHeight;
  final String label;
  final bool switchValue;
  final ValueChanged<bool> onSwitchChanged;
  const CharacterSettings(
      {super.key,
      required this.containerWidth,
      required this.containerHeight,
      required this.label,
      required this.switchValue,
      required this.onSwitchChanged});

  @override
  State<CharacterSettings> createState() => _CharacterSettingsState();
}

class _CharacterSettingsState extends State<CharacterSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      height: widget.containerHeight,
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
              widget.label,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            CupertinoSwitch(
                value: widget.switchValue,
                activeColor: purple,
                onChanged: (value) {
                  setState(() {
                    widget.onSwitchChanged(value);
                  });
                })
          ],
        ),
      ),
    );
  }
}

//show me how to use this component
class CharacterSettingsPartTwo extends StatelessWidget {
  const CharacterSettingsPartTwo(
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
