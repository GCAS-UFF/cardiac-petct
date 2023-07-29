import 'package:cardiac_petct/features/anamnesis/anamnesis_cubit.dart';
import 'package:cardiac_petct/src/input_validators/validations_mixin.dart';
import 'package:cardiac_petct/src/ui/petct_radio_button.dart';
import 'package:cardiac_petct/src/ui/petct_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class SmokeForm extends StatefulWidget {
  const SmokeForm({super.key});

  @override
  State<SmokeForm> createState() => _SmokeFormState();
}

class _SmokeFormState extends State<SmokeForm> with ValidationsMixin {
  final AnamnesisCubit cubit = Modular.get();
  final TextEditingController smokesController = TextEditingController();
  final TextEditingController cigarettesPerDayController =
      TextEditingController();
  final TextEditingController howLongController = TextEditingController();
  bool get shouldValidate => (smokesController.text == 'yes');

  @override
  void initState() {
    super.initState();
    if (cubit.anamnesisEntity.cigarettesPerDay != null) {
      cigarettesPerDayController.text =
          cubit.anamnesisEntity.cigarettesPerDay.toString();
    }

    if (cubit.anamnesisEntity.smokesHowLong != null) {
      howLongController.text = cubit.anamnesisEntity.smokesHowLong.toString();
    }

    smokesController.text = cubit.anamnesisEntity.smokes == true ? 'yes' : 'no';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'smokes-title'.i18n(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          children: [
            PetctRadioButton(
              title: 'yes-answer'.i18n(),
              groupValue: smokesController.text,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    smokesController.text = value;
                    cubit.anamnesisEntity =
                        cubit.anamnesisEntity.copyWith(smokes: true);
                  }
                });
              },
              value: 'yes',
            ),
            PetctRadioButton(
              title: 'no-answer'.i18n(),
              groupValue: smokesController.text,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    smokesController.text = value;
                    cubit.anamnesisEntity = cubit.anamnesisEntity.copyWith(
                      smokes: false,
                      cigarettesPerDay: null,
                      smokesHowLong: null,
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
              PetctTextFormField(
                controller: howLongController,
                hintText: 'how-long-smokes-question'.i18n(),
                textInputType: TextInputType.number,
                validator: shouldValidate ? isNotEmpty : null,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    cubit.anamnesisEntity = cubit.anamnesisEntity
                        .copyWith(smokesHowLong: int.parse(value));
                  }
                },
              ),
              const SizedBox(
                height: 32,
              ),
              PetctTextFormField(
                controller: cigarettesPerDayController,
                hintText: 'how-many-cigaretter-per-day-question'.i18n(),
                textInputType: TextInputType.number,
                validator: shouldValidate ? isNotEmpty : null,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    cubit.anamnesisEntity = cubit.anamnesisEntity
                        .copyWith(cigarettesPerDay: int.parse(value));
                  }
                },
              ),
            ],
          ),
      ],
    );
  }
}
