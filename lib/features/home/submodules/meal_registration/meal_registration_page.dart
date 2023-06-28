import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
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
        title: const Text('Adicionar ao diário'),
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
                final successState = state as MealRegistrationSuccessState;
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
                      'Marque os itens consumidos e suas quantidades',
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
                      children: const [
                        Text('Item'),
                        Text('Quantidade'),
                      ],
                    ),
                    Column(
                      children: widget.meal.items!
                          .map(
                            (mealItem) => PetCtSelectItemQuantity(
                              mealItem: mealItem,
                              isSelected: true,
                              onSelection: (value) {},
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Fez alguma alteração nos itens prato? Comente aqui ',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PetctTextFormField(
                      controller: TextEditingController(),
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
                                      widget.menuId, widget.meal);
                                },
                                child: const Text(
                                  'Adicionar ao diário ',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: PetctOutlinedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Cancelar',
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
}
