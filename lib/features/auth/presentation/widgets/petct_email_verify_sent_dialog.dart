import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:flutter/material.dart';

class PetctEmailVerifySentDialog extends StatelessWidget {
  const PetctEmailVerifySentDialog({super.key});

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
            ' Email de recuperação enviado',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(
                child: PetctOutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'Ok',
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
