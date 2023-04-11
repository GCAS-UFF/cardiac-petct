import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PetctWaitingMealCard extends StatefulWidget {
  final String title;
  const PetctWaitingMealCard({super.key, required this.title});

  @override
  State<PetctWaitingMealCard> createState() => _PetctWaitingMealCardState();
}

class _PetctWaitingMealCardState extends State<PetctWaitingMealCard> {
  bool isCardOpen = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 65,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).dialogBackgroundColor,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: isCardOpen
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    )
                  : BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 8),
                  child: const Icon(
                    FeatherIcons.clock,
                  ),
                ),
                Expanded(
                    child: Text(
                  widget.title,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                )),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isCardOpen = !isCardOpen;
                    });
                  },
                  icon: Icon(
                    isCardOpen
                        ? Icons.indeterminate_check_box_outlined
                        : Icons.add_box_outlined,
                  ),
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 150),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
              height: isCardOpen ? null : 0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Ovos mexidos com manteiga + xícara de café sem açucar e sem adoçante',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ingredientes',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'Quantidade',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ovo',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '2 unidades',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const Divider(),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PetctOutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'Escolher prato',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
