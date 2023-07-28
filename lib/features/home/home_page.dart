import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cardiac_petct/features/home/home_cubit.dart';
import 'package:cardiac_petct/src/utils/date_formatter.dart';
import 'package:cardiac_petct/src/utils/string_formatter.dart';

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
                    tabs: List.generate(
                      success.menu.length,
                      (index) => Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormatter.dateFormat(
                                        success.menu[index].dietDay!),
                                    style: const TextStyle(fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    StringFormatter.intToOrdinal(index + 1),
                                    style: const TextStyle(fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                                        child: cubit.chooseMealCard(
                                            day.breakFasts!.first,
                                            day.id!,
                                            cubit.isLate(day)))
                                    : Container(),
                                (day.morningSnacks != null &&
                                        day.morningSnacks!.isNotEmpty)
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: cubit.chooseMealCard(
                                            day.morningSnacks!.first,
                                            day.id!,
                                            cubit.isLate(day)),
                                      )
                                    : Container(),
                                (day.lunchs != null && day.lunchs!.isNotEmpty)
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: cubit.chooseMealCard(
                                            day.lunchs!.first, day.id!, cubit.isLate(day)),
                                      )
                                    : Container(),
                                (day.afternoonSnacks != null &&
                                        day.afternoonSnacks!.isNotEmpty)
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: cubit.chooseMealCard(
                                            day.afternoonSnacks!.first,
                                            day.id!,
                                            cubit.isLate(day)),
                                      )
                                    : Container(),
                                (day.dinners != null && day.dinners!.isNotEmpty)
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: cubit.chooseMealCard(
                                            day.dinners!.first,
                                            day.id!,
                                            cubit.isLate(day)),
                                      )
                                    : Container(),
                                (day.suppers != null && day.suppers!.isNotEmpty)
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: cubit.chooseMealCard(
                                            day.suppers!.first,
                                            day.id!,
                                            cubit.isLate(day)),
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
