import 'package:flutter/material.dart';

class PetctFoodGroupCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Image image;
  final Function() onPressed;
  const PetctFoodGroupCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 71,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      margin: const EdgeInsets.only(right: 1.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          image,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),
          IconButton(
              onPressed: () => onPressed(),
              icon: const Icon(Icons.arrow_forward_ios_sharp))
        ],
      ),
    );
  }
}
