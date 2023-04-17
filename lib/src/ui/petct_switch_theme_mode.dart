import 'package:cardiac_petct/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PetctSwitchThemeMode extends StatefulWidget {
  const PetctSwitchThemeMode({super.key});

  @override
  State<PetctSwitchThemeMode> createState() => _PetctSwitchThemeModeState();
}

class _PetctSwitchThemeModeState extends State<PetctSwitchThemeMode> {
  final AppController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: controller.themeSwitch.value,
          onChanged: (bool value) => setState(() {
            controller.changeTheme(value);
          }),
        ),
        Icon(
          controller.themeSwitch.value ? FeatherIcons.sun : FeatherIcons.moon,
        ),
      ],
    );
  }
}
