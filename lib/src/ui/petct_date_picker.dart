import 'package:cardiac_petct/src/ui/petct_text_form_field.dart';
import 'package:flutter/material.dart';

class PetctDatePicker extends StatelessWidget {
  final Function(DateTime?) onValue;
  final TextEditingController controller;
  final Function(String?) validator;
  const PetctDatePicker(
      {super.key,
      required this.onValue,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 360),
          ),
        );
        onValue(date);
      },
      child: AbsorbPointer(
        child: PetctTextFormField(
          controller: controller,
          readOnly: true,
          hintText: 'Data',
          validator: (value) => validator(value),
          suffixIcon: const Icon(Icons.arrow_drop_down_outlined),
        ),
      ),
    );
  }
}
