import 'package:flutter/material.dart';

class PetctCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool?)? onChanged;
  final String title;
  const PetctCheckbox(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Expanded(child: Text(title)),
      ],
    );
  }
}
