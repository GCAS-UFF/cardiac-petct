import 'package:cardiac_petct/features/auth/submodules/email_verify/email_verify_cubit.dart';
import 'package:cardiac_petct/src/shared/resources/images.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localization/localization.dart';

class EmailVerifyPage extends StatefulWidget {
  const EmailVerifyPage({super.key});

  @override
  State<EmailVerifyPage> createState() => _EmailVerifyPageState();
}

class _EmailVerifyPageState extends State<EmailVerifyPage> {
  final EmailVerifyCubit cubit = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          if (state.runtimeType == EmailVerifyEmailSentState) {
            var snackBar = SnackBar(
              content: Text(
                'email-successfully-sent'.i18n(),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state.runtimeType == EmailVerifyErrorState) {
            final errorState = state as EmailVerifyErrorState;
            var snackBar = SnackBar(
              content: Text(
                errorState.failure.errorMessage,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'email-confirmation-title'.i18n(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'email-confirmation-text'.i18n(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 56,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Images.emailVerifyIllustration,
                      width: 250,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 56,
                ),
                Row(
                  children: [
                    Expanded(
                      child: PetctElevatedButton(
                        onPressed: () async {
                          cubit.confirmEmailVerified();
                        },
                        child: Text(
                          'email-verified-label'.i18n(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: PetctOutlinedButton(
                        onPressed: () async {
                          cubit.sendEmailVerification();
                        },
                        child: Text(
                          'resend-confirmation-email'.i18n(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
