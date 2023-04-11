import 'package:cardiac_petct/src/input_validators/validations_mixin.dart';
import 'package:cardiac_petct/src/shared/resources/images.dart';

import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_text_button.dart';
import 'package:cardiac_petct/src/ui/petct_text_form_field.dart';
import 'package:flutter/material.dart';

class PetctRecoverPasswordDialog extends StatefulWidget {
  const PetctRecoverPasswordDialog({super.key});

  @override
  State<PetctRecoverPasswordDialog> createState() =>
      _PetctRecoverPasswordDialogState();
}

class _PetctRecoverPasswordDialogState extends State<PetctRecoverPasswordDialog>
    with ValidationsMixin {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Images.petctLogo,
              width: 78,
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              'Recuperação de senha',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 26,
            ),
            // Email
            Form(
              key: _formKey,
              child: PetctTextFormField(
                controller: _emailController,
                hintText: 'Email',
                validator: (value) => combine(
                  [
                    () => isNotEmpty(value),
                    () => isEmailValid(value),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Expanded(
                  child: PetctElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text(
                      'Enviar',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: PetctTextButton(
                    onPressed: () {},
                    child: const Text(
                      'Voltar',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
