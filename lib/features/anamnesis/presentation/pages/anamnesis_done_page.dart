import 'package:cardiac_petct/features/anamnesis/anamnesis_cubit.dart';
import 'package:cardiac_petct/src/shared/resources/images.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localization/localization.dart';

class AnamnesisDonePage extends StatefulWidget {
  const AnamnesisDonePage({super.key});

  @override
  State<AnamnesisDonePage> createState() => _AnamnesisDonePageState();
}

class _AnamnesisDonePageState extends State<AnamnesisDonePage> {
  final AnamnesisCubit cubit = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'congratulations-form-done'.i18n(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    Images.anamnesisDone,
                    width: 250,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: PetctElevatedButton(
                    onPressed: () {
                      cubit.sendAnamnesisForm();
                    },
                    child: Text('finish-label'.i18n()),
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
