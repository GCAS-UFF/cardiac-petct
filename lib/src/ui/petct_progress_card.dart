import 'package:flutter/material.dart';

class PetctProgressCard extends StatefulWidget {
  final String title;
  final IconData iconData;
  final String contentText;
  final Widget? actions;
  const PetctProgressCard({
    super.key,
    required this.title,
    required this.contentText,
    required this.iconData,
    this.actions,
  });

  @override
  State<PetctProgressCard> createState() => _PetctProgressCardState();
}

class _PetctProgressCardState extends State<PetctProgressCard> {
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
              color: Theme.of(context).primaryColor,
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
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    widget.iconData,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
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
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.contentText,
                          textAlign: TextAlign.start,
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
                  if (widget.actions != null) widget.actions!
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
