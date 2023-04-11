import 'package:flutter/material.dart';

class PetctRadioButton extends StatelessWidget {
  final String title;
  final String? groupValue;
  final Function(String?) onChanged;
  final String value;
  const PetctRadioButton(
      {super.key,
      required this.title,
      required this.groupValue,
      required this.onChanged,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
