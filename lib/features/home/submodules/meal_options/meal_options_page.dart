import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cardiac_petct/features/home/home_cubit.dart';
import 'package:cardiac_petct/src/utils/word_translator.dart';
import 'package:cardiac_petct/src/ui/petct_item_quantity.dart';
import 'package:cardiac_petct/src/utils/string_formatter.dart';
import 'package:cardiac_petct/src/shared/resources/images.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/submodules/meal_options/meal_options_cubit.dart';

class MealOptionsPage extends StatefulWidget {
  final Meal meal;
  final String menuId;
  const MealOptionsPage({super.key, required this.meal, required this.menuId});

  @override
  State<MealOptionsPage> createState() => _MealOptionsPageState();
}

class _MealOptionsPageState extends State<MealOptionsPage>
    with SingleTickerProviderStateMixin {
  final MealOptionsCubit cubit = Modular.get();
  final HomeCubit homeCubit = Modular.get();

  @override
  void initState() {
    super.initState();
    cubit.initialize(widget.meal.type!.mealType);
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
        title: Text(
          'choose-plate-title'.i18n(),
        ),
      ),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          if (state.runtimeType == MealOptionsEditedState) {
            homeCubit.initialize();
            Modular.to.pop();
          }
        },
        builder: (context, state) {
          if (state.runtimeType == MealOptionsErrorState) {
            return IconButton(
                onPressed: () => cubit.initialize(widget.meal.type!.mealType),
                icon: const Icon(Icons.replay_outlined));
          }
          if (state.runtimeType == MealOptionsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.runtimeType == MealOptionsSuccessState) {
            final successState = state as MealOptionsSuccessState;
            return DefaultTabController(
              length: successState.options.length,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 22, left: 22, right: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    TabBar(
                      indicatorColor: Colors.transparent,
                      indicatorWeight: 0,
                      labelPadding: const EdgeInsets.all(0),
                      indicator: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelColor: Theme.of(context).colorScheme.onPrimary,
                      tabs: List.generate(
                        successState.options.length,
                        (index) => Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Text(
                                'Prato ${index + 1}',
                                textAlign: TextAlign.center,
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: List.generate(
                          successState.options.length,
                          (index) => SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        StringFormatter.listMealItemsNames(
                                            successState.options[index].items!),
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 22),
                                    child: Image.asset(
                                      Images.plateDefault,
                                      width: 160,
                                    )),
                                const SizedBox(
                                  height: 32,
                                ),
                                PetctItemQuantity(
                                    items: successState.options[index].items!),
                                const SizedBox(
                                  height: 32,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: PetctElevatedButton(
                                            onPressed: () {
                                              cubit.setMealOption(
                                                widget.menuId,
                                                successState.options[index],
                                              );
                                            },
                                            child: Text(
                                              'choose-plate-title'.i18n(),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
