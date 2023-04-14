import 'package:cardiac_petct/features/anamnesis/anamnesis_cubit.dart';
import 'package:cardiac_petct/src/input_validators/validations_mixin.dart';
import 'package:cardiac_petct/src/ui/petct_dropdown_button.dart';
import 'package:cardiac_petct/src/ui/petct_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class DrinkForm extends StatefulWidget {
  const DrinkForm({super.key});

  @override
  State<DrinkForm> createState() => _SmokeFormState();
}

class _SmokeFormState extends State<DrinkForm> with ValidationsMixin {
  final AnamnesisCubit cubit = Modular.get();
  final TextEditingController drinksController = TextEditingController();
  final TextEditingController drinksTypeController = TextEditingController();
  final TextEditingController drinksFrequencyController =
      TextEditingController();
  bool get shouldValidate => (drinksController.text == 'yes');
  String? selectedDrinkType;
  String? selectedDrinkFrequency;
  List<DropdownMenuItem<String>> drinksType = [
    DropdownMenuItem<String>(
      value: 'drink-type-beer'.i18n(),
      child: Text(
        'drink-type-beer'.i18n(),
      ),
    ),
    DropdownMenuItem<String>(
      value: 'drink-type-wine'.i18n(),
      child: Text(
        'drink-type-wine'.i18n(),
      ),
    ),
    DropdownMenuItem<String>(
      value: 'drink-type-liquor'.i18n(),
      child: Text(
        'drink-type-liquor'.i18n(),
      ),
    ),
    DropdownMenuItem<String>(
      value: 'drink-type-vodka-whiskey'.i18n(),
      child: Text(
        'drink-type-vodka-whiskey'.i18n(),
      ),
    ),
  ];

  final List<String> drinkFrequency = [
    'drink-frequency-option-one'.i18n(),
    'drink-frequency-option-two'.i18n(),
    'drink-frequency-option-three'.i18n()
  ];

  @override
  void initState() {
    super.initState();
    drinksController.text = cubit.anamnesisEntity.drinks == true ? 'yes' : 'no';
    if (cubit.anamnesisEntity.drinksType != null) {
      drinksTypeController.text = cubit.anamnesisEntity.drinksType!;
      selectedDrinkType = drinksTypeController.text;
    }

    if (cubit.anamnesisEntity.drinkFrequency != null) {
      drinksFrequencyController.text = cubit.anamnesisEntity.drinkFrequency!;
      selectedDrinkFrequency = drinksFrequencyController.text;
    } else {
      drinksFrequencyController.text = drinkFrequency.first;
      selectedDrinkFrequency = drinkFrequency.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'drink-question'.i18n(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          children: [
            PetctRadioButton(
              title: 'yes-answer'.i18n(),
              groupValue: drinksController.text,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    drinksController.text = value;
                    cubit.anamnesisEntity =
                        cubit.anamnesisEntity.copyWith(drinks: true);
                  }
                });
              },
              value: 'yes',
            ),
            PetctRadioButton(
              title: 'no-answer'.i18n(),
              groupValue: drinksController.text,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    drinksController.text = value;
                    cubit.anamnesisEntity = cubit.anamnesisEntity.copyWith(
                      drinks: false,
                    );
                  }
                });
              },
              value: 'no',
            )
          ],
        ),
        if (shouldValidate)
          Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              PetcetDropdownButton(
                items: drinksType,
                hintText: 'most-consumed-drink-question'.i18n(),
                seletedItem: selectedDrinkType,
                validator: shouldValidate ? isNotEmpty : null,
                onChanged: (value) {
                  if (value != null) {
                    drinksTypeController.text = value;
                    cubit.anamnesisEntity = cubit.anamnesisEntity.copyWith(
                      drinksType: value,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Column(
                children: drinkFrequency.map((frequencyOption) {
                  return Row(
                    children: [
                      Expanded(
                        child: PetctRadioButton(
                          title: frequencyOption,
                          horizontal: true,
                          groupValue: selectedDrinkFrequency,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                drinksFrequencyController.text = value;
                                selectedDrinkFrequency = value;
                                cubit.anamnesisEntity = cubit.anamnesisEntity
                                    .copyWith(drinkFrequency: value);
                              });
                            }
                          },
                          value: frequencyOption,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              )
            ],
          ),
      ],
    );
  }
}
