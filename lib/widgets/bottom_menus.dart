import 'package:flutter/material.dart';
import 'package:password_generator/constants.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
    required this.menuName,
    required this.borderRadius,
    required this.icon,
  });

  final double containerWidth;
  final double containerHeight;
  final double borderRadius;
  final String menuName;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: containerHeight,
              width: containerWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: blueShade,
              ),
              child: Center(
                child: icon,
              ),
            ),
            Text(
              menuName,
              style: TextStyle(
                color: blueShade,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
