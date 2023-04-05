import 'package:flutter/material.dart';

class PetctCounter extends StatelessWidget {
  final int value;
  const PetctCounter({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.remove_circle_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add_circle_outline_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
