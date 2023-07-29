import 'package:cardiac_petct/src/shared/resources/images.dart';
import 'package:flutter/material.dart';

class PetctLogoTitled extends StatelessWidget {
  final String? title;
  final double? size;
  const PetctLogoTitled({super.key, this.title = '', this.size = 148});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Images.petctLogo,
          width: size,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          title!,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.transparent,
            decoration: TextDecoration.underline,
            decorationColor: Theme.of(context).colorScheme.primary,
            decorationThickness: 3,
            shadows: [
              Shadow(
                  color: Theme.of(context).textTheme.titleMedium!.color!,
                  offset: const Offset(0, -5))
            ],
          ),
        ),
      ],
    );
  }
}
