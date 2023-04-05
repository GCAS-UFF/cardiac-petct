import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PetctForbiddenFoodCard extends StatelessWidget {
  final Image image;
  final String title;
  const PetctForbiddenFoodCard(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 161,
          width: 141,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
          margin: const EdgeInsets.only(right: 1.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: Icon(
            FeatherIcons.slash,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ],
    );
    ;
  }
}
