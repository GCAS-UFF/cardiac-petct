import 'package:flutter/material.dart';

part './color_schemes.g.dart';
part './custom_color.g.dart';

final themeLight = ThemeData(
  useMaterial3: true,
  colorScheme: _lightColorScheme,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
  ),
  dialogTheme:
      DialogTheme(backgroundColor: lightCustomColors.sourceWhitebackground),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return lightCustomColors.sourcePrimarygreen;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return lightCustomColors.sourceWhitebackground;
        },
      ),
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          );
        },
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return lightCustomColors.sourceTextcolor;
        },
      ),
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return const TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
          );
        },
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      side: MaterialStateProperty.resolveWith(
        (states) {
          return BorderSide(
              width: 2, color: lightCustomColors.sourcePrimarygreen!);
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return lightCustomColors.sourcePrimarygreen;
        },
      ),
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          );
        },
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: lightCustomColors.sourcePrimarygreen!,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: lightCustomColors.sourceErrorcolor!,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: lightCustomColors.sourcePrimarygreen!,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    hintStyle: const TextStyle(
      fontFamily: 'Montserrat',
    ),
    labelStyle: const TextStyle(
      fontFamily: 'Montserrat',
    ),
    errorStyle: const TextStyle(
      fontFamily: 'Montserrat',
    ),
    floatingLabelStyle: const TextStyle(
      fontFamily: 'Montserrat',
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith(
      (states) {
        return lightCustomColors.sourcePrimarygreen;
      },
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightCustomColors.sourcePrimarygreen!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightCustomColors.sourceErrorcolor!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightCustomColors.sourcePrimarygreen!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    textStyle: const TextStyle(
      fontFamily: 'Montserrat',
    ),
  ),
);

final themeDark = ThemeData(
  useMaterial3: true,
  colorScheme: _darkColorScheme,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          );
        },
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return const TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
          );
        },
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return const TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          );
        },
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(),
      borderRadius: BorderRadius.circular(5),
    ),
    errorBorder: const OutlineInputBorder(),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: const OutlineInputBorder(),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      hintStyle: const TextStyle(
        fontFamily: 'Montserrat',
      ),
      labelStyle: const TextStyle(
        fontFamily: 'Montserrat',
      ),
      errorStyle: const TextStyle(
        fontFamily: 'Montserrat',
      ),
      floatingLabelStyle: const TextStyle(
        fontFamily: 'Montserrat',
      ),
    ),
  ),
);
