import 'package:cardiac_petct/features/anamnesis/anamnesis_cubit.dart';
import 'package:cardiac_petct/src/input_validators/validations_mixin.dart';
import 'package:cardiac_petct/src/ui/petct_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class PhysicalExerciseForm extends StatefulWidget {
  const PhysicalExerciseForm({super.key});

  @override
  State<PhysicalExerciseForm> createState() => _SmokeFormState();
}

class _SmokeFormState extends State<PhysicalExerciseForm>
    with ValidationsMixin {
  final AnamnesisCubit cubit = Modular.get();
  final TextEditingController doPhysicalExerciseController =
      TextEditingController();
  final TextEditingController exerciseFrequencyController =
      TextEditingController();
  bool get shouldValidate => (doPhysicalExerciseController.text == 'yes');
  String? selectedExerciseFrequency;

  final List<String> exerciseFrequency = [
    'physical-exercises-frequency-option-one'.i18n(),
    'physical-exercises-frequency-option-two'.i18n(),
    'physical-exercises-frequency-option-three'.i18n(),
    'physical-exercises-frequency-option-four'.i18n(),
  ];

  @override
  void initState() {
    super.initState();
    doPhysicalExerciseController.text =
        cubit.anamnesisEntity.doPhysicalExercisesPerDay == true ? 'yes' : 'no';
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
          'practice-physical-exercises-question'.i18n(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          children: [
            PetctRadioButton(
              title: 'yes-answer'.i18n(),
              groupValue: doPhysicalExerciseController.text,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    doPhysicalExerciseController.text = value;
                    cubit.anamnesisEntity = cubit.anamnesisEntity
                        .copyWith(doPhysicalExercisesPerDay: true);
                  }
                });
              },
              value: 'yes',
            ),
            PetctRadioButton(
              title: 'no-answer'.i18n(),
              groupValue: doPhysicalExerciseController.text,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    doPhysicalExerciseController.text = value;
                    cubit.anamnesisEntity = cubit.anamnesisEntity.copyWith(
                      doPhysicalExercisesPerDay: false,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                'physical-exercises-frequency-question'.i18n(),
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
