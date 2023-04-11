import 'package:cardiac_petct/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PetctSwitchThemeMode extends StatefulWidget {
  const PetctSwitchThemeMode({super.key});

  @override
  State<PetctSwitchThemeMode> createState() => _PetctSwitchThemeModeState();
}

class _PetctSwitchThemeModeState extends State<PetctSwitchThemeMode> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: AppController.instance.themeSwitch.value,
          onChanged: (bool value) => setState(() {
            AppController.instance.changeTheme(value);
          }),
        ),
        Icon(
          AppController.instance.themeSwitch.value
              ? FeatherIcons.sun
              : FeatherIcons.moon,
        ),
      ],
    );
  }
}
