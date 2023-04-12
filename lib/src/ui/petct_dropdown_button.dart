import 'package:flutter/material.dart';

class PetcetDropdownButton extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final String? seletedItem;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  const PetcetDropdownButton(
      {super.key,
      required this.items,
      required this.seletedItem,
      required this.onChanged,
      this.validator,
      this.hintText = ''});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      items: items,
      value: seletedItem,
      hint: Text(hintText!),
      onChanged: (value) => onChanged(value),
      validator: validator,
    );
  }
}
