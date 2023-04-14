import 'package:flutter/material.dart';

class PetctRadioButton extends StatelessWidget {
  final String title;
  final String? groupValue;
  final Function(String?) onChanged;
  final String value;
  final bool? horizontal;
  const PetctRadioButton(
      {super.key,
      this.horizontal = false,
      required this.title,
      required this.groupValue,
      required this.onChanged,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!horizontal!)
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            if (horizontal!)
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
