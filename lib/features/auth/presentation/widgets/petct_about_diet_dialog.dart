import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

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
                'Sobre a dieta',
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
                  text: 'Você deverá seguir uma',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: ' dieta cetogênica ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextSpan(
                  text: 'para o preparo do exame',
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
          Text('O que é uma dieta cetogênica?',
              style: Theme.of(context).textTheme.titleMedium),
          Text(
            'É uma dieta extremamente baixa em carboidratos, nutrientes presentes em alimentos como massas, cereais como o arroz e o milho, doces e em alguns tipos de legumes. ',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text('E por que devo seguir essa dieta?',
              style: Theme.of(context).textTheme.titleMedium),
          Text(
            'Porque o consumo de carboidratos antes da realização do exame pode comprometer a imagem do exame e levar a um diagnóstico impreciso',
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
