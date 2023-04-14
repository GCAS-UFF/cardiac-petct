import 'package:cardiac_petct/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:cardiac_petct/features/auth/widgets/petct_about_diet_dialog.dart';
import 'package:cardiac_petct/src/services/firebase_autorizator_service.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_logo_titled.dart';
import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:cardiac_petct/src/ui/petct_switch_theme_mode.dart';
import 'package:cardiac_petct/src/ui/petct_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: const [
            PetctSwitchThemeMode(),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PetctLogoTitled(
                title: 'app-name-title'.i18n(),
              ),
              const SizedBox(
                height: 68,
              ),
              Text(
                'create-account-text'.i18n(),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 14),
              ),
              const SizedBox(
                height: 36,
              ),
              Row(
                children: [
                  Expanded(
                    child: PetctElevatedButton(
                      onPressed: () {
                        Modular.to.pushNamed('/auth/registration/');
                      },
                      child: Text(
                        'first-access-label'.i18n(),
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
                      onPressed: () {
                        Modular.to.pushNamed('/auth/login/');
                      },
                      child: Text(
                        'sign-in-label'.i18n(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              PetctTextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const PetctAboutDietDialog());
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FeatherIcons.info,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                     Text(
                      'about-diet-label'.i18n(),
                    ),
                    const Icon(
                      FeatherIcons.info,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
