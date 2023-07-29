import 'package:cardiac_petct/src/ui/petct_text_form_field.dart';
import 'package:flutter/material.dart';

class PetctTimePicker extends StatelessWidget {
  final TextEditingController controller;
  final Function(TimeOfDay?) onValue;
  final Function(String?) validator;
  const PetctTimePicker(
      {super.key,
      required this.controller,
      required this.onValue,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        onValue(time);
      },
      child: AbsorbPointer(
        child: PetctTextFormField(
          controller: controller,
          readOnly: true,
          hintText: 'Hora',
          suffixIcon: const Icon(
            Icons.arrow_drop_down_outlined,
          ),
          validator: (value) => validator(value),
        ),
      ),
    );
  }
}
