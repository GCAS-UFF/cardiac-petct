import 'package:cardiac_petct/features/auth/presentation/widgets/petct_about_diet_dialog.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_logo_titled.dart';
import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:cardiac_petct/src/ui/petct_switch_theme_mode.dart';
import 'package:cardiac_petct/src/ui/petct_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

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
              const PetctLogoTitled(
                title: 'App Endocardite',
              ),
              const SizedBox(
                height: 68,
              ),
              Text(
                'Crie uma conta para visualizar as dietas sugeridas, acompanhar o progresso até o dia do exame e receber alertas de refeições',
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
                      onPressed: () {},
                      child: const Text(
                        'Primeiro acesso',
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
                      onPressed: () {},
                      child: const Text(
                        'Entrar',
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
                    const Text(
                      'Sobre a dieta',
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
