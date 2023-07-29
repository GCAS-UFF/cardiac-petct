import 'package:cardiac_petct/features/anamnesis/anamnesis_cubit.dart';
import 'package:cardiac_petct/src/input_validators/validations_mixin.dart';
import 'package:cardiac_petct/src/ui/petct_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class ChronicalDiseasesForm extends StatefulWidget {
  const ChronicalDiseasesForm({super.key});

  @override
  State<ChronicalDiseasesForm> createState() => _SmokeFormState();
}

class _SmokeFormState extends State<ChronicalDiseasesForm>
    with ValidationsMixin {
  final AnamnesisCubit cubit = Modular.get();
  final List<String> selectedChronicalDiseasesForm = [];
  final List<String> chronicalDiseasesForm = [
    'chronical-disease-option-one'.i18n(),
    'chronical-disease-option-two'.i18n(),
    'chronical-disease-option-three'.i18n(),
    'chronical-disease-option-four'.i18n(),
    'chronical-disease-option-five'.i18n(),
    'chronical-disease-option-six'.i18n(),
    'chronical-disease-option-seven'.i18n(),
    'chronical-disease-option-eight'.i18n(),
    'chronical-disease-option-nine'.i18n(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'select-chronical-diseases'.i18n(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 32,
        ),
        Column(
          children: chronicalDiseasesForm.map((chornicalDisease) {
            return Row(
              children: [
                Expanded(
                  child: PetctCheckbox(
                    title: chornicalDisease,
                    onChanged: (value) {
                      if (value != null) {
                        setState(
                          () {
                            if (value == true) {
                              selectedChronicalDiseasesForm
                                  .add(chornicalDisease);
                              cubit.anamnesisEntity = cubit.anamnesisEntity
                                  .copyWith(
                                      chronicDiseaseAndCommorbities:
                                          selectedChronicalDiseasesForm);
                            } else {
                              selectedChronicalDiseasesForm
                                  .remove(chornicalDisease);
                              cubit.anamnesisEntity = cubit.anamnesisEntity
                                  .copyWith(
                                      chronicDiseaseAndCommorbities:
                                          selectedChronicalDiseasesForm);
                            }
                          },
                        );
                      }
                    },
                    value: selectedChronicalDiseasesForm
                        .contains(chornicalDisease),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
