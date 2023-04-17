import 'package:cardiac_petct/src/modules/app_config/domain/repositories/app_config_local_repository.dart';
import 'package:flutter/material.dart';

class AppController {
  final AppConfigLocalRepository appConfigLocalRepository;

  AppController(this.appConfigLocalRepository) {
    initThemeMode();
  }
  Future<void> initThemeMode() async {
    themeSwitch.value = await appConfigLocalRepository.getThemeMode();
  }

  final ValueNotifier themeSwitch = ValueNotifier<bool>(true);

  void changeTheme(bool value) {
    themeSwitch.value = value;
    appConfigLocalRepository.setThemeMode(value);
  }
}
