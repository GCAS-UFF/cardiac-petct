import 'package:cardiac_petct/features/home/data/models/measurement_model.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_item.dart';
import 'package:cardiac_petct/src/utils/string_formatter.dart';
import 'package:cardiac_petct/src/utils/word_translator.dart';
import 'package:flutter/material.dart';

class PetctItemQuantity extends StatelessWidget {
  final List<MealItem> items;
  const PetctItemQuantity({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ingredientes',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Quantidade',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        Column(
          children: items.map((item) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (item.translatedWord != null)
                      Text(WordTranslator.wordByDeviceLocale(
                          item.translatedWord!)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: item.foodsItens!.map((food) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  WordTranslator.wordByDeviceLocale(
                                      food.translatedWord!),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            Column(
                              children: item.measurements.map((measurement) {
                                return Text(
                                  '${StringFormatter.removeDecimalZeroFormat(measurement.consumedPortion!)} ${MeasurementExtension.nameFromEnum(measurement.measurementUnity)}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                );
                              }).toList(),
                            )
                          ],
                        );
                      }).toList(),
                    )
                  ],
                ),
                const Divider(),
              ],
            );
          }).toList(),
        )
      ],
    );
  }
}
