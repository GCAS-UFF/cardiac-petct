import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class PetctRecoverPasswordEmailSentDialog extends StatelessWidget {
  const PetctRecoverPasswordEmailSentDialog({super.key});

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
          const SizedBox(
            height: 32,
          ),
          Text(
            'recover-email-sent'.i18n(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 32,
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
