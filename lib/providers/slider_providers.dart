import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:password_generator/constants.dart';

class FirstSlider extends StateNotifier<Color> {
  FirstSlider() : super(grey);
  void changeColor(Color newColor) {
    state = newColor;
  }

  void resetColor(Color newColor) {
    state = newColor;
  }
}

class SecondSlider extends StateNotifier<Color> {
  SecondSlider() : super(grey);
  void changeColor(Color newColor) {
    state = newColor;
  }

  void resetColor(Color newColor) {
    state = newColor;
  }
}

class ThirdSlider extends StateNotifier<Color> {
  ThirdSlider() : super(grey);
  void changeColor(Color newColor) {
    state = newColor;
  }

  void resetColor(Color newColor) {
    state = newColor;
  }
}

final firstSliderProvider =
    StateNotifierProvider<FirstSlider, Color>((ref) => FirstSlider());

final secondSliderProvider =
    StateNotifierProvider<SecondSlider, Color>((ref) => SecondSlider());

final thirdSliderProvider =
    StateNotifierProvider<ThirdSlider, Color>((ref) => ThirdSlider());
