import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_item_quantity.dart';
import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:cardiac_petct/src/utils/string_formatter.dart';
import 'package:cardiac_petct/src/utils/word_translator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PetctLateMealCard extends StatefulWidget {
  final MealType mealType;
  final Meal meal;
  final String menuId;
  const PetctLateMealCard(
      {super.key,
      required this.mealType,
      required this.meal,
      required this.menuId});

  @override
  State<PetctLateMealCard> createState() => _PetctLateMealCardState();
}

class _PetctLateMealCardState extends State<PetctLateMealCard> {
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
              color: Theme.of(context).colorScheme.error,
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
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    FeatherIcons.check,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      WordTranslator.wordByDeviceLocale(
                        widget.mealType.translatedWord!,
                      ),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'Pendente',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
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
                    color: Theme.of(context).colorScheme.background,
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
              width: double.infinity,
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
                              .copyWith(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.error),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
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
                  Row(
                    children: [
                      Expanded(
                        child: PetctElevatedButton(
                          onPressed: () {
                            Modular.to.pushNamed(
                              '/home/meal-registration/',
                              arguments: [widget.meal, widget.menuId],
                            );
                          },
                          child: const Text(
                            'Adicionar ao diário',
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
