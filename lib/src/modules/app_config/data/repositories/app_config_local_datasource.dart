import 'package:cardiac_petct/src/modules/app_config/data/app_config_local_datasource/app_config_local_datasource.dart';
import 'package:cardiac_petct/src/modules/app_config/domain/repositories/app_config_local_repository.dart';

class AppConfigLocalRepositoryImp extends AppConfigLocalRepository {
  final AppConfigLocalDataSource appConfigLocalDataSource;

  AppConfigLocalRepositoryImp(this.appConfigLocalDataSource);
  @override
  Future<bool> getThemeMode() async {
    return await appConfigLocalDataSource.getThemeMode();
  }

  @override
  Future<void> setThemeMode(bool isDark) {
    return appConfigLocalDataSource.setThemeMode(isDark);
  }
}
