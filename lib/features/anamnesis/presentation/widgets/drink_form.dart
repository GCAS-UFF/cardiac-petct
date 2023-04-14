import 'package:cardiac_petct/features/anamnesis/anamnesis_cubit.dart';
import 'package:cardiac_petct/src/input_validators/validations_mixin.dart';
import 'package:cardiac_petct/src/ui/petct_dropdown_button.dart';
import 'package:cardiac_petct/src/ui/petct_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
  bool get shouldValidate => (drinksController.text == 'sim');
  String? selectedDrinkType;
  String? selectedDrinkFrequency;
  List<DropdownMenuItem<String>> drinksType = [
    const DropdownMenuItem<String>(
      value: 'Cerveja',
      child: Text(
        'Cerveja',
      ),
    ),
    const DropdownMenuItem<String>(
      value: 'Vinho',
      child: Text(
        'Vinho',
      ),
    ),
    const DropdownMenuItem<String>(
      value: 'Cachaça',
      child: Text(
        'Cachaça',
      ),
    ),
    const DropdownMenuItem<String>(
      value: 'Vodka/Whiskey',
      child: Text(
        'Vodka/Whiskey',
      ),
    ),
  ];

  final List<String> drinkFrequency = [
    '1 dose por dia ou até 7 doses na semana',
    'entre 1 e 3 doses por dia ou até 21 doses na semana',
    'mais que 3 doses por dia ou até 21 doses na semana'
  ];

  @override
  void initState() {
    super.initState();
    drinksController.text =
        cubit.anamnesisEntity.drinks == true ? 'sim' : 'não';
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
          'Consome bebidas alcoólicas?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          children: [
            PetctRadioButton(
              title: 'Sim',
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
              value: 'sim',
            ),
            PetctRadioButton(
              title: 'Não',
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
              value: 'não',
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
                hintText: 'Qual a bebida mais consumida?',
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
