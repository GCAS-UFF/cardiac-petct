import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:cardiac_petct/src/ui/petct_item_quantity.dart';
import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:cardiac_petct/src/utils/string_formatter.dart';
import 'package:cardiac_petct/src/utils/word_translator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PetctWaitingMealCard extends StatefulWidget {
  final MealType mealType;
  final Meal meal;
  final String menuId;
  const PetctWaitingMealCard(
      {super.key,
      required this.mealType,
      required this.meal,
      required this.menuId});

  @override
  State<PetctWaitingMealCard> createState() => _PetctWaitingMealCardState();
}

class _PetctWaitingMealCardState extends State<PetctWaitingMealCard> {
  bool isCardOpen = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 65,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).dialogBackgroundColor,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: isCardOpen
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    )
                  : BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 8),
                  child: const Icon(
                    FeatherIcons.clock,
                  ),
                ),
                Expanded(
                    child: Text(
                  WordTranslator.wordByDeviceLocale(
                    widget.mealType.translatedWord!,
                  ),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                )),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isCardOpen = !isCardOpen;
                    });
                  },
                  icon: Icon(
                    isCardOpen
                        ? Icons.indeterminate_check_box_outlined
                        : Icons.add_box_outlined,
                  ),
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 150),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
              height: isCardOpen ? null : 0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          StringFormatter.listMealItemsNames(
                              widget.meal.items!),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  PetctItemQuantity(items: widget.meal.items!),
                  Row(
                    children: [
                      Expanded(
                        child: PetctOutlinedButton(
                          onPressed: () {
                            Modular.to.pushNamed(
                              '/home/meal-options/',
                              arguments: [widget.meal, widget.menuId],
                            );
                          },
                          child: const Text(
                            'Escolher prato',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
