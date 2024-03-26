import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:password_generator/constants.dart';

class FirstSliderNotifier extends StateNotifier<Color> {
  FirstSliderNotifier() : super(grey);
  void changeColor(Color newColor) {
    state = newColor;
  }

  void resetColor(Color newColor) {
    state = newColor;
  }
}

class SecondSliderNotifier extends StateNotifier<Color> {
  SecondSliderNotifier() : super(grey);
  void changeColor(Color newColor) {
    state = newColor;
  }

  void resetColor(Color newColor) {
    state = newColor;
  }
}

class ThirdSliderNotifier extends StateNotifier<Color> {
  ThirdSliderNotifier() : super(grey);
  void changeColor(Color newColor) {
    state = newColor;
  }

  void resetColor(Color newColor) {
    state = newColor;
  }
}

final firstSliderProvider = StateNotifierProvider<FirstSliderNotifier, Color>(
    (ref) => FirstSliderNotifier());

final secondSliderProvider = StateNotifierProvider<SecondSliderNotifier, Color>(
    (ref) => SecondSliderNotifier());

final thirdSliderProvider = StateNotifierProvider<ThirdSliderNotifier, Color>(
    (ref) => ThirdSliderNotifier());
