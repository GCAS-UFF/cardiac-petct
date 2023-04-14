import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class PetctAboutDietDialog extends StatelessWidget {
  const PetctAboutDietDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
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
                'about-diet-title'.i18n(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w300, fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'about-diet-text-one'.i18n(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: ' ${'about-diet-text-two'.i18n()} ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextSpan(
                  text: 'about-diet-text-three'.i18n(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text('about-diet-text-four'.i18n(),
              style: Theme.of(context).textTheme.titleMedium),
          Text(
            'about-diet-text-five'.i18n(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text('about-diet-text-six'.i18n(),
              style: Theme.of(context).textTheme.titleMedium),
          Text(
            'about-diet-text-seven'.i18n(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: PetctOutlinedButton(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  child: Text(
                    'ok-label'.i18n(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
