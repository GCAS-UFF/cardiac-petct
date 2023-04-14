import 'package:cardiac_petct/features/anamnesis/anamnesis_cubit.dart';
import 'package:cardiac_petct/src/input_validators/validations_mixin.dart';
import 'package:cardiac_petct/src/ui/petct_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    'hipertensão arterial (pressão alta)',
    'diabetes',
    'doença renal crônica',
    'doença pulmonar obstrutiva crônica',
    'asma brônquica',
    'câncer',
    'colesterol/triglicerídeos elevados',
    'acidente vascular cerebral (derrame cerebral)',
    'outra doença não listada',
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
          'Selecione as doenças crônicas que possui (se possuir)',
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
