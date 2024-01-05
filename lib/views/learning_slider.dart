import 'package:flutter/material.dart';
import 'package:password_generator/utils/button.dart';

class SliderX extends StatefulWidget {
  const SliderX({Key? key}) : super(key: key);

  @override
  State<SliderX> createState() => _SliderXState();
}

class _SliderXState extends State<SliderX> {
  // List of colors
  List<Color> sliderColorx = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    'Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //write this into a component that can be re used in this parent
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      if (details.primaryDelta! > 0) {
                        setState(() {
                          sliderColorx[0] = Colors.red;
                          sliderColorx[1] = Colors.grey;
                          sliderColorx[2] = Colors.grey;
                        });
                      } else {
                        setState(() {
                          sliderColorx[0] = Colors.grey;
                          sliderColorx[1] = Colors.grey;
                          sliderColorx[2] = Colors.grey;
                        });
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: sliderColorx[0],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      if (details.primaryDelta! > 0) {
                        setState(() {
                          sliderColorx[0] = Colors.yellow;
                          sliderColorx[1] = Colors.yellow;
                          sliderColorx[2] = Colors.grey;
                        });
                      } else {
                        setState(() {
                          sliderColorx[0] = Colors.red;
                          sliderColorx[1] = Colors.grey;
                          sliderColorx[2] = Colors.grey;
                        });
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: sliderColorx[1],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      if (details.primaryDelta! > 0) {
                        setState(() {
                          sliderColorx[0] = Colors.green;
                          sliderColorx[1] = Colors.green;
                          sliderColorx[2] = Colors.green;
                        });
                      } else {
                        setState(() {
                          sliderColorx[0] = Colors.yellow;
                          sliderColorx[1] = Colors.yellow;
                          sliderColorx[2] = Colors.grey;
                        });
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: sliderColorx[2],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonImageFb1(
                text: 'Generate',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
