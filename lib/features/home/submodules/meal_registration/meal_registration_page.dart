import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_item.dart';
import 'package:cardiac_petct/features/home/home_cubit.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/meal_registration_cubit.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:cardiac_petct/src/ui/petct_select_item_quantity.dart';
import 'package:cardiac_petct/src/ui/petct_text_form_field.dart';
import 'package:cardiac_petct/src/utils/word_translator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class MealRegistrationPage extends StatefulWidget {
  final Meal meal;
  final String menuId;
  const MealRegistrationPage(
      {super.key, required this.meal, required this.menuId});

  @override
  State<MealRegistrationPage> createState() => _MealRegistrationPageState();
}

class _MealRegistrationPageState extends State<MealRegistrationPage> {
  final MealRegistrationCubit cubit = Modular.get();
  final HomeCubit homeCubit = Modular.get();
  final TextEditingController commentController = TextEditingController();

  List<MealItem> checkedItems = [];

  @override
  void initState() {
    super.initState();
    if (widget.meal.items != null) checkedItems = widget.meal.items!;
    if (widget.meal.comment != null) {
      commentController.text = widget.meal.comment!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Modular.to.pop(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text('add-diary-label'.i18n()),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 22, left: 22, right: 22),
        child: SingleChildScrollView(
          child: BlocConsumer(
            bloc: cubit,
            listener: (context, state) {
              if (state.runtimeType == MealRegistrationEditedState) {
                homeCubit.initialize();
                Modular.to.pop();
              }
            },
            builder: (context, state) {
              if (state.runtimeType == MealRegistrationLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.runtimeType == MealRegistrationErrorState) {
                return IconButton(
                    onPressed: () {}, icon: const Icon(Icons.update));
              }
              if (state.runtimeType == MealRegistrationSuccessState) {
                return Column(
                  children: [
                    Text(
                      '${WordTranslator.wordByDeviceLocale(
                        widget.meal.type!.translatedWord!,
                      )} - 07:00',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Primeiro dia'),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'portion-consumed-text'.i18n(),
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 22),
                      child: Image.network(
                        'https://www.pngkey.com/png/full/947-9471813_tilpia-empanada-imagens-de-pratos-de-comida-png.png',
                        width: 160,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('item-title'.i18n()),
                        Text('quantity-title'.i18n()),
                      ],
                    ),
                    Column(
                      children: List.generate(checkedItems.length, (item) {
                        return PetCtSelectItemQuantity(
                          mealItem: checkedItems[item],
                          isSelected: _checkSelection(checkedItems[item]),
                          onDecrease: () {
                            setState(
                              () {
                                for (int measurement = 0;
                                    measurement <
                                        checkedItems[item].measurements.length;
                                    measurement++) {
                                  if (checkedItems[item]
                                          .measurements[measurement]
                                          .consumedPortion! ==
                                      checkedItems[item]
                                          .measurements[measurement]
                                          .portion) {
                                    final consumedPortion = checkedItems[item]
                                            .measurements[measurement]
                                            .portion /
                                        2;
                                    checkedItems[item]
                                            .measurements[measurement] =
                                        checkedItems[item]
                                            .measurements[measurement]
                                            .copyWith(
                                              consumedPortion: consumedPortion,
                                            );
                                  } else if (checkedItems[item]
                                          .measurements[measurement]
                                          .consumedPortion! >
                                      0) {
                                    checkedItems[item]
                                            .measurements[measurement] =
                                        checkedItems[item]
                                            .measurements[measurement]
                                            .copyWith(
                                              consumedPortion: 0,
                                            );
                                  }
                                }
                              },
                            );
                          },
                          onIncrease: () {
                            setState(
                              () {
                                for (int measurement = 0;
                                    measurement <
                                        checkedItems[item].measurements.length;
                                    measurement++) {
                                  if (checkedItems[item]
                                          .measurements[measurement]
                                          .consumedPortion! ==
                                      checkedItems[item]
                                              .measurements[measurement]
                                              .portion /
                                          2) {
                                    checkedItems[item]
                                            .measurements[measurement] =
                                        checkedItems[item]
                                            .measurements[measurement]
                                            .copyWith(
                                              consumedPortion:
                                                  checkedItems[item]
                                                      .measurements[measurement]
                                                      .portion,
                                            );
                                  }
                                }
                              },
                            );
                          },
                          onSelection: (value) {
                            setState(() {
                              if (value == true) {
                                for (int i = 0; i < checkedItems.length; i++) {
                                  checkedItems[item].measurements[i] =
                                      checkedItems[item]
                                          .measurements[i]
                                          .copyWith(
                                              consumedPortion:
                                                  checkedItems[item]
                                                      .measurements[i]
                                                      .portion);
                                }
                              } else {
                                for (int i = 0; i < checkedItems.length; i++) {
                                  checkedItems[item].measurements[i] =
                                      checkedItems[item]
                                          .measurements[i]
                                          .copyWith(consumedPortion: 0);
                                }
                              }
                            });
                          },
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'meal-comment-text'.i18n(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PetctTextFormField(
                      controller: commentController,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: PetctElevatedButton(
                                onPressed: () {
                                  cubit.registrateMeal(
                                    widget.menuId,
                                    widget.meal,
                                    commentController.text,
                                  );
                                },
                                child: Text(
                                  'add-diary-label'.i18n(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: PetctOutlinedButton(
                                onPressed: () {
                                  homeCubit.initialize();
                                  Modular.to.pop();
                                },
                                child: Text(
                                  'cancel-label'.i18n(),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  bool _checkSelection(MealItem mealItem) {
    return mealItem.measurements.first.consumedPortion! > 0;
  }
}
