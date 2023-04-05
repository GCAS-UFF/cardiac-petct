import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PetctTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? textInputType;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final int? maxLength;
  final Widget? suffixIcon;
  final bool? readOnly;
  const PetctTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.inputFormatters,
    this.validator,
    this.maxLength,
    this.suffixIcon,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      obscureText: obscureText!,
      readOnly: readOnly!,
      decoration: InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
    );
  }
}
