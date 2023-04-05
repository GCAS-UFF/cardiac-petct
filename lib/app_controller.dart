import 'package:flutter/material.dart';

class AppController {
  static final AppController instance = AppController();

  AppController();
  final ValueNotifier themeSwitch = ValueNotifier<bool>(true);

  void changeTheme(bool value) {
    themeSwitch.value = value;
  }
}
