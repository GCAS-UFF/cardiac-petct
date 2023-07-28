import 'package:flutter/material.dart';
import 'package:cardiac_petct/src/modules/app_config/domain/repositories/app_config_local_repository.dart';

class AppController {
  final AppConfigLocalRepository appConfigLocalRepository;

  AppController(this.appConfigLocalRepository) {
    initThemeMode();
  }
  Future<void> initThemeMode() async {
    themeSwitch.value = await appConfigLocalRepository.getThemeMode();
  }

  final ValueNotifier<bool> themeSwitch = ValueNotifier<bool>(true);

  void changeTheme(bool isDark) {
    themeSwitch.value = isDark;
    appConfigLocalRepository.setThemeMode(isDark);
  }
}
