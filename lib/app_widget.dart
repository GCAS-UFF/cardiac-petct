import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:cardiac_petct/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cardiac_petct/src/shared/themes/themes_schemes.dart';
import 'package:cardiac_petct/src/localizations/localizations_directories.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController controller = Modular.get();
    return ValueListenableBuilder<bool>(
      valueListenable: controller.themeSwitch,
      builder: (context, isDark, child) {
        LocalJsonLocalization.delegate.directories =
            LocalizationsDirectories.localizationsDirectoriesList;
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: themeLight,
          darkTheme: themeDark,
          themeMode: isDark == true ? ThemeMode.dark : ThemeMode.light,
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('es', 'ES'),
            Locale('pt', 'BR'),
            Locale('it', 'IT')
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            LocalJsonLocalization.delegate,
          ],
        );
      },
    );
  }
}
