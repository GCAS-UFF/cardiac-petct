import 'package:flutter/material.dart';

class PetctTextButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  const PetctTextButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: child,
    );
  }
}
