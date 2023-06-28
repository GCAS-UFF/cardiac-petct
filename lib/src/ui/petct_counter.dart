import 'package:cardiac_petct/features/home/domain/entities/measurement.dart';
import 'package:flutter/material.dart';

class PetctCounter extends StatelessWidget {
  final Measurement measurement;
  const PetctCounter({super.key, required this.measurement});

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
          '${measurement.portion.toInt().toString()} ${MeasurementExtension.abbreviatedNameFromEnum(measurement.measurementUnity)}',
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
