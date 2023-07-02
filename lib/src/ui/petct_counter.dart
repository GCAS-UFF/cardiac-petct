import 'package:cardiac_petct/features/home/domain/entities/measurement.dart';
import 'package:cardiac_petct/src/utils/string_formatter.dart';
import 'package:flutter/material.dart';

class PetctCounter extends StatelessWidget {
  final List<Measurement> measurements;
  final bool isSelected;
  final Function() onDecrease;
  final Function() onIncrease;
  const PetctCounter(
      {super.key,
      required this.measurements,
      required this.isSelected,
      required this.onDecrease,
      required this.onIncrease});

  @override
  Widget build(BuildContext context) {
    final canIncrease = isSelected == true &&
        measurements.first.consumedPortion! < measurements.first.portion;
    final canDecrease =
        isSelected == true && measurements.first.consumedPortion! > 0;
    return Row(
      children: [
        IconButton(
          onPressed: () => canDecrease ? onDecrease() : null,
          icon: Icon(
            Icons.remove_circle_outline,
            color: canDecrease
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
          ),
        ),
        isSelected
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(measurements.length, (index) {
                  return Text(
                    '${StringFormatter.removeDecimalZeroFormat(measurements[index].consumedPortion!)} ${MeasurementExtension.abbreviatedNameFromEnum(measurements[index].measurementUnity)}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18),
                  );
                }))
            : Text(
                '0',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 18),
              ),
        IconButton(
          onPressed: () => canIncrease ? onIncrease() : null,
          icon: Icon(
            Icons.add_circle_outline_outlined,
            color: canIncrease
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
          ),
        ),
      ],
    );
  }
}
