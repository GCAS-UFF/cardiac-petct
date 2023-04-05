import 'package:flutter/material.dart';

class PetctOutlinedButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final Color? color;
  const PetctOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
