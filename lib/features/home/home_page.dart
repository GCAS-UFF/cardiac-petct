import 'package:cardiac_petct/features/home/home_cubit.dart';
import 'package:cardiac_petct/src/ui/petct_done_meal_card.dart';
import 'package:cardiac_petct/src/ui/petct_waiting_meal_card.dart';
import 'package:cardiac_petct/src/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final HomeCubit cubit = Modular.get();
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    cubit.initialize();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 22, left: 22, right: 22),
        height: double.infinity,
        child: SafeArea(
          child: BlocConsumer(
            bloc: cubit,
            listener: (context, state) {},
            builder: (context, state) {
              if (state.runtimeType == HomeLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.runtimeType == HomeErrorState) {
                return IconButton(
                  onPressed: () => cubit.initialize(),
                  icon: const Icon(
                    Icons.update,
                  ),
                );
              }
              final success = state as HomeSuccessState;
              return Column(
                children: [
                  TabBar(
                    indicatorColor: Colors.transparent,
                    indicatorWeight: 0,
                    labelPadding: const EdgeInsets.all(0),
                    indicator: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelColor: Theme.of(context).colorScheme.onPrimary,
                    controller: tabController,
                    tabs: [
                      Tab(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormatter.dateFormat(DateTime.now()),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'first-day-tab'.i18n(),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormatter.dateFormat(
                                      DateTime.now().add(
                                        const Duration(days: 1),
                                      ),
                                    ),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'second-day-tab'.i18n(),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormatter.dateFormat(
                                      DateTime.now().add(
                                        const Duration(days: 2),
                                      ),
                                    ),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'third-day-tab'.i18n(),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: success.menu.map(
                        (day) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                (day.breakFasts != null &&
                                        day.breakFasts!.isNotEmpty)
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: Column(
                                          children: [
                                            (day.breakFasts!.first.isRegistered)
                                                ? PetctDoneMealCard(
                                                    meal: day.breakFasts!.first,
                                                    mealType: day.breakFasts!
                                                        .first.type!,
                                                    menuId: day.id!,
                                                  )
                                                : PetctWaitingMealCard(
                                                    meal: day.breakFasts!.first,
                                                    mealType: day.breakFasts!
                                                        .first.type!,
                                                    menuId: day.id!,
                                                  ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                (day.morningSnacks != null &&
                                        day.morningSnacks!.isNotEmpty)
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: Column(
                                          children: [
                                            (day.morningSnacks!.first
                                                    .isRegistered)
                                                ? PetctDoneMealCard(
                                                    meal: day
                                                        .morningSnacks!.first,
                                                    mealType: day.morningSnacks!
                                                        .first.type!,
                                                    menuId: day.id!,
                                                  )
                                                : PetctWaitingMealCard(
                                                    meal: day
                                                        .morningSnacks!.first,
                                                    mealType: day.morningSnacks!
                                                        .first.type!,
                                                    menuId: day.id!,
                                                  ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                (day.lunchs != null && day.lunchs!.isNotEmpty)
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: Column(
                                          children: [
                                            (day.lunchs!.first.isRegistered)
                                                ? PetctDoneMealCard(
                                                    meal: day.lunchs!.first,
                                                    mealType:
                                                        day.lunchs!.first.type!,
                                                    menuId: day.id!,
                                                  )
                                                : PetctWaitingMealCard(
                                                    meal: day.lunchs!.first,
                                                    mealType:
                                                        day.lunchs!.first.type!,
                                                    menuId: day.id!,
                                                  ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                (day.afternoonSnacks != null &&
                                        day.afternoonSnacks!.isNotEmpty)
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: Column(
                                          children: [
                                            (day.afternoonSnacks!.first
                                                    .isRegistered)
                                                ? PetctDoneMealCard(
                                                    meal: day
                                                        .afternoonSnacks!.first,
                                                    mealType: day
                                                        .afternoonSnacks!
                                                        .first
                                                        .type!,
                                                    menuId: day.id!,
                                                  )
                                                : PetctWaitingMealCard(
                                                    meal: day
                                                        .afternoonSnacks!.first,
                                                    mealType: day
                                                        .afternoonSnacks!
                                                        .first
                                                        .type!,
                                                    menuId: day.id!,
                                                  ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                (day.dinners != null && day.dinners!.isNotEmpty)
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: Column(
                                          children: [
                                            (day.dinners!.first.isRegistered)
                                                ? PetctDoneMealCard(
                                                    meal: day.dinners!.first,
                                                    mealType: day
                                                        .dinners!.first.type!,
                                                    menuId: day.id!,
                                                  )
                                                : PetctWaitingMealCard(
                                                    meal: day.dinners!.first,
                                                    mealType: day
                                                        .dinners!.first.type!,
                                                    menuId: day.id!,
                                                  ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                (day.suppers != null && day.suppers!.isNotEmpty)
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: Column(
                                          children: [
                                            (day.suppers!.first.isRegistered)
                                                ? PetctDoneMealCard(
                                                    meal: day.suppers!.first,
                                                    mealType: day
                                                        .suppers!.first.type!,
                                                    menuId: day.id!,
                                                  )
                                                : PetctWaitingMealCard(
                                                    meal: day.suppers!.first,
                                                    mealType: day
                                                        .suppers!.first.type!,
                                                    menuId: day.id!,
                                                  ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
