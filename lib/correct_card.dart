import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_generator/constants.dart';

class CorrectCard extends StatelessWidget {
  const CorrectCard({
    super.key,
    required this.details,
  });

  final CardDetails details;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(16 * 0.65),
                height: 45,
                width: 65,
                decoration: BoxDecoration(
                  color: deepBlueShade,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Text(details.firstTitle ?? ''),
              ),
              const Icon(Icons.more_vert, color: Colors.white54)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(details.secondTitle ?? ''),
              details.switchButton,
            ],
          ),
        ],
      ),
    );
  }
}

class CardDetails {
  final String? firstTitle, secondTitle;
  final Widget switchButton;
  final Icon? icon;

  CardDetails({
    this.firstTitle,
    this.secondTitle,
    required this.switchButton,
    this.icon,
  });
}

final detailsList = [
  CardDetails(
      firstTitle: '123',
      secondTitle: 'Digits',
      switchButton: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: false,
          onChanged: (value) {},
        ),
      )),
  CardDetails(
      firstTitle: 'ABC',
      secondTitle: 'Characters',
      switchButton: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: false,
          onChanged: (value) {},
        ),
      )),
  CardDetails(
      firstTitle: '@#!',
      secondTitle: 'Symbols',
      switchButton: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: false,
          onChanged: (value) {},
        ),
      )),
];

class CharacterSettingsGridView extends StatelessWidget {
  const CharacterSettingsGridView({
    super.key,
    required this.crossAxisCount,
  });

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: detailsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 10,
        childAspectRatio: 1.4,
      ),
      itemBuilder: (context, index) => CorrectCard(details: detailsList[index]),
    );
  }
}
