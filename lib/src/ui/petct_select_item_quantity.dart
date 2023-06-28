import 'package:cardiac_petct/features/home/domain/entities/meal_item.dart';
import 'package:cardiac_petct/src/ui/petct_counter.dart';
import 'package:cardiac_petct/src/utils/word_translator.dart';
import 'package:flutter/material.dart';

class PetCtSelectItemQuantity extends StatelessWidget {
  final MealItem mealItem;
  final bool isSelected;
  final Function(bool?) onSelection;
  const PetCtSelectItemQuantity(
      {super.key,
      required this.mealItem,
      required this.isSelected,
      required this.onSelection});

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
                      WordTranslator.wordByDeviceLocale(
                          mealItem.translatedWord != null
                              ? mealItem.translatedWord!
                              : mealItem.foodsItens!.first.translatedWord!),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            PetctCounter(measurement: mealItem.measurements.first),
          ],
        ),
        const Divider()
      ],
    );
  }
}
