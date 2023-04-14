import 'package:cardiac_petct/features/anamnesis/anamnesis_cubit.dart';
import 'package:cardiac_petct/src/input_validators/validations_mixin.dart';
import 'package:cardiac_petct/src/ui/petct_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhysicalForm extends StatefulWidget {
  const PhysicalForm({super.key});

  @override
  State<PhysicalForm> createState() => _PhysicalFormState();
}

class _PhysicalFormState extends State<PhysicalForm> with ValidationsMixin {
  final AnamnesisCubit cubit = Modular.get();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  var heightMask = MaskTextInputFormatter(
    mask: '#.##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    super.initState();
    if (cubit.anamnesisEntity.weight > 0) {
      weightController.text = cubit.anamnesisEntity.weight.toInt().toString();
    }
    if (cubit.anamnesisEntity.height > 0) {
      heightController.text = cubit.anamnesisEntity.height.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'physical-shape'.i18n(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 32,
        ),
        PetctTextFormField(
          controller: weightController,
          hintText: 'weight-hint'.i18n(),
          textInputType: TextInputType.number,
          maxLength: 3,
          validator: isNotEmpty,
          onChanged: (value) {
            if (value.isNotEmpty) {
              cubit.anamnesisEntity =
                  cubit.anamnesisEntity.copyWith(weight: double.parse(value));
            } else {
              cubit.anamnesisEntity = cubit.anamnesisEntity.copyWith(weight: 0);
            }
          },
        ),
        const SizedBox(
          height: 32,
        ),
        PetctTextFormField(
            controller: heightController,
            hintText: 'height-hint'.i18n(),
            inputFormatters: [heightMask],
            textInputType: TextInputType.number,
            validator: isNotEmpty,
            onChanged: (value) {
              if (value.isNotEmpty) {
                cubit.anamnesisEntity =
                    cubit.anamnesisEntity.copyWith(height: double.parse(value));
              } else {
                cubit.anamnesisEntity =
                    cubit.anamnesisEntity.copyWith(height: 0);
              }
            }),
      ],
    );
  }
}
