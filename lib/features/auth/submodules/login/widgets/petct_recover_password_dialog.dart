import 'package:cardiac_petct/features/auth/submodules/login/login_cubit.dart';
import 'package:cardiac_petct/features/auth/submodules/login/widgets/petct_recover_password_email_sent_dialog.dart';
import 'package:cardiac_petct/src/input_validators/validations_mixin.dart';
import 'package:cardiac_petct/src/shared/resources/images.dart';

import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_text_button.dart';
import 'package:cardiac_petct/src/ui/petct_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

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
  final LoginCubit cubit = Modular.get();
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
        child: BlocConsumer(
          bloc: cubit,
          listener: (context, state) {
            if (state.runtimeType == LoginSuccessState) {
              Modular.to.pop();
              showDialog(
                context: context,
                builder: (context) {
                  return const PetctRecoverPasswordEmailSentDialog();
                },
              );
            }
            if (state.runtimeType == LoginErrorState) {
              Modular.to.pop();
              final errorState = state as LoginErrorState;
              var snackBar = SnackBar(
                content: Text(
                  errorState.failure.errorMessage,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            return Column(
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
                  'recover-password-title'.i18n(),
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
                    hintText: 'email-hint'.i18n(),
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
                          if (_formKey.currentState!.validate()) {
                            cubit.sentRecoverPasswordEmail(
                                _emailController.text);
                          }
                        },
                        child: state.runtimeType == LoginLoadingState
                            ? Center(
                                child: CircularProgressIndicator(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              )
                            : Text(
                                'send-label'.i18n(),
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
                        onPressed: () {
                          Modular.to.pop();
                        },
                        child: Text(
                          'back-label'.i18n(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
