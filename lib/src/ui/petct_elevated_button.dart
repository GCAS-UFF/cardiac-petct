import 'package:flutter/material.dart';

class PetctElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  const PetctElevatedButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
