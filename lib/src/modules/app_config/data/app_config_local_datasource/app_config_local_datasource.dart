import 'package:cardiac_petct/src/modules/app_config/constants/app_config_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppConfigLocalDataSource {
  Future<void> setThemeMode(bool isDark);
  Future<bool> getThemeMode();
}

class AppConfigLocalDataSourceImp implements AppConfigLocalDataSource {
  final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();
  AppConfigLocalDataSourceImp();

  @override
  Future<void> setThemeMode(bool isDark) async {
    final SharedPreferences prefs = await _preferences;
    await prefs.setBool(AppConfigKeys.isDark, isDark);
  }

  @override
  Future<bool> getThemeMode() async {
    final SharedPreferences prefs = await _preferences;
    final isDark = prefs.getBool(AppConfigKeys.isDark);
    if (isDark != null) {
      return isDark;
    } else {
      return false;
    }
  }
}
