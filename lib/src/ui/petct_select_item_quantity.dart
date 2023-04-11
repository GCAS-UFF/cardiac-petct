import 'package:cardiac_petct/src/ui/petct_counter.dart';
import 'package:flutter/material.dart';

class PetCtSelectItemQuantity extends StatelessWidget {
  final bool isSelected;
  final Function(bool?) onSelection;
  const PetCtSelectItemQuantity(
      {super.key, required this.isSelected, required this.onSelection});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: isSelected,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      onChanged: (value) => onSelection(value),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Xícara de café sem açúcar e sem adoçante',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const PetctCounter(value: 2),
          ],
        ),
        const Divider()
      ],
    );
  }
}
