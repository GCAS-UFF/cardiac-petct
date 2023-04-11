import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PetctPercentIndicator extends StatelessWidget {
  final String title;
  final double percent;
  final double? radius;
  final double? lineWidth;
  final CircularStrokeCap? circularStrokeCap;
  const PetctPercentIndicator({
    super.key,
    required this.title,
    required this.percent,
    this.radius = 60.0,
    this.lineWidth = 8.0,
    this.circularStrokeCap = CircularStrokeCap.round,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius!,
      lineWidth: lineWidth!,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge,
      ),backgroundColor: Theme.of(context).colorScheme.outlineVariant,
      progressColor: Theme.of(context).colorScheme.primary,
    );
  }
}
