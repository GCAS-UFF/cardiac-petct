import 'package:flutter/material.dart';

class PetctNotificationCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String timeOfDay;
  final IconData icon;
  final Widget button;
  final Color color;
  const PetctNotificationCard(
      {super.key,
      required this.title,
      this.subtitle,
      required this.icon,
      required this.button,
      required this.color,
      required this.timeOfDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 2,
          color: color,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.restaurant,
            size: 48,
            color: color,
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timeOfDay,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                if (subtitle != null)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          subtitle!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [button],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
