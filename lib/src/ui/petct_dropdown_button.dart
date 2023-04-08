import 'package:flutter/material.dart';

class PetcetDropdownButton extends StatelessWidget {
  final List<String> items;
  final String? seletedItem;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  const PetcetDropdownButton(
      {super.key,
      required this.items,
      required this.seletedItem,
      required this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      items: items
          .map(
            (value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          )
          .toList(),
      value: seletedItem,
      onChanged: (value) => onChanged(value),
      validator: validator,
    );
  }
}
