import 'package:flutter/material.dart';

class PetctSwitchButtonTheme extends StatelessWidget {
  final bool isLight;
  final Function() onPressed;
  const PetctSwitchButtonTheme(
      {super.key, required this.isLight, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.sunny,
        ),
      ],
    );
  }
}
