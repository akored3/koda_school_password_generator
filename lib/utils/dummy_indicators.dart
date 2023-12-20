import 'package:flutter/material.dart';

class DummyIndicators extends StatefulWidget {
  const DummyIndicators({super.key});

  @override
  State<DummyIndicators> createState() => _DummyIndicatorsState();
}

class _DummyIndicatorsState extends State<DummyIndicators> {
  List<Color> indicatorColor = [Colors.grey, Colors.grey, Colors.grey];
  List<double> indicatorWidth = [10.0, 10.0, 10.0];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    void checkIndicators(int index) {
      setState(() {
        if (selectedIndex != -1) {
          indicatorColor[selectedIndex] = Colors.grey;
          indicatorWidth[selectedIndex] = 10.0;
        }

        if (indicatorColor[index] == Colors.grey) {
          indicatorColor[index] = Colors.blue;
          indicatorWidth[index] = 25.5;
        } else {
          indicatorColor[index] = Colors.grey;
          indicatorWidth[index] = 10.0;
        }
        selectedIndex = index;
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            checkIndicators(0);
          },
          child: Container(
            height: 10,
            width: indicatorWidth[0].toDouble(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: indicatorColor[0],
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            checkIndicators(1);
          },
          child: Container(
            height: 10,
            width: indicatorWidth[1].toDouble(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: indicatorColor[1],
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            checkIndicators(2);
          },
          child: Container(
            height: 10,
            width: indicatorWidth[2].toDouble(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: indicatorColor[2],
            ),
          ),
        ),
      ],
    );
  }
}
