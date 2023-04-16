import 'package:cardiac_petct/app_controller.dart';
import 'package:cardiac_petct/src/localizations/localizations_directories.dart';
import 'package:cardiac_petct/src/shared/themes/themes_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppController.instance.themeSwitch,
      builder: (context, value, child) {
        LocalJsonLocalization.delegate.directories =
            LocalizationsDirectories.localizationsDirectoriesList;
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: themeLight,
          darkTheme: themeDark,
          themeMode: value ? ThemeMode.light : ThemeMode.dark,
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
