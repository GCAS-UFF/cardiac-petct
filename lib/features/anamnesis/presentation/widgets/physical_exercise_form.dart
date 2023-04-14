import 'package:cardiac_petct/features/anamnesis/anamnesis_cubit.dart';
import 'package:cardiac_petct/src/input_validators/validations_mixin.dart';
import 'package:cardiac_petct/src/ui/petct_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PhysicalExerciseForm extends StatefulWidget {
  const PhysicalExerciseForm({super.key});

  @override
  State<PhysicalExerciseForm> createState() => _SmokeFormState();
}

class _SmokeFormState extends State<PhysicalExerciseForm>
    with ValidationsMixin {
  final AnamnesisCubit cubit = Modular.get();
  final TextEditingController drinksController = TextEditingController();
  final TextEditingController exerciseFrequencyController =
      TextEditingController();
  bool get shouldValidate => (drinksController.text == 'sim');
  String? selectedExerciseFrequency;

  final List<String> exerciseFrequency = [
    '1  a 2 dias',
    '3 a 4 dias',
    '5 a 6 dias',
    '7 dias',
  ];

  @override
  void initState() {
    super.initState();
    drinksController.text =
        cubit.anamnesisEntity.drinks == true ? 'sim' : 'não';
    if (cubit.anamnesisEntity.physicalExerciseFrequency != null) {
      exerciseFrequencyController.text =
          cubit.anamnesisEntity.physicalExerciseFrequency!;
      selectedExerciseFrequency = exerciseFrequencyController.text;
    } else {
      exerciseFrequencyController.text = exerciseFrequency.first;
      selectedExerciseFrequency = exerciseFrequency.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Pratica atividade física por pelo menos 30 minutos por dia?',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                'Quantos dias na semana?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 22,
              ),
              Column(
                children: exerciseFrequency.map((frequencyOption) {
                  return Row(
                    children: [
                      Expanded(
                        child: PetctRadioButton(
                          title: frequencyOption,
                          horizontal: true,
                          groupValue: selectedExerciseFrequency,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                exerciseFrequencyController.text = value;
                                selectedExerciseFrequency = value;
                                cubit.anamnesisEntity = cubit.anamnesisEntity
                                    .copyWith(physicalExerciseFrequency: value);
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
