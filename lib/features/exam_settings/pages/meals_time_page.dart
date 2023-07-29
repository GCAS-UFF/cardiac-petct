import 'package:cardiac_petct/features/exam_settings/exam_settings_cubit.dart';
import 'package:cardiac_petct/src/ui/petct_dropdown_button.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class MealsTimePage extends StatefulWidget {
  const MealsTimePage({super.key});

  @override
  State<MealsTimePage> createState() => _MealsTimePageState();
}

class _MealsTimePageState extends State<MealsTimePage> {
  final ExamSettingsCubit cubit = Modular.get();
  TimeOfDay? breakfasts;
  TimeOfDay? morningSnacks;
  TimeOfDay? lunchs;
  TimeOfDay? afternoonSnacks;
  TimeOfDay? dinners;
  TimeOfDay? suppers;
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
      ),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          if (state.runtimeType == ExamSettingsSavedState) {
            Modular.to.navigate('/home/');
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('select-meals-time-text'.i18n(),
                    style: Theme.of(context).textTheme.titleMedium!),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 22, bottom: 16, top: 22),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: Text(
                          'meals-time-title'.i18n(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 22),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            TimeOfDay? hour = await showTimePicker(
                              context: context,
                              initialTime: const TimeOfDay(hour: 7, minute: 00),
                            );
                            setState(() {
                              breakfasts = hour;
                            });
                          },
                          child: AbsorbPointer(
                            child: PetcetDropdownButton(
                                hintText: breakfasts != null
                                    ? breakfasts!.format(context)
                                    : 'breakfast-hint'.i18n(),
                                items: const [],
                                seletedItem: '',
                                onChanged: (value) {}),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            TimeOfDay? hour = await showTimePicker(
                              context: context,
                              initialTime: const TimeOfDay(hour: 9, minute: 00),
                            );
                            setState(() {
                              morningSnacks = hour;
                            });
                          },
                          child: AbsorbPointer(
                            child: PetcetDropdownButton(
                                hintText: morningSnacks != null
                                    ? morningSnacks!.format(context)
                                    : 'afternoonsnack-hint'.i18n(),
                                items: const [],
                                seletedItem: '',
                                onChanged: (value) {}),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            TimeOfDay? hour = await showTimePicker(
                              context: context,
                              initialTime:
                                  const TimeOfDay(hour: 12, minute: 00),
                            );
                            setState(() {
                              lunchs = hour;
                            });
                          },
                          child: AbsorbPointer(
                            child: PetcetDropdownButton(
                                hintText: lunchs != null
                                    ? lunchs!.format(context)
                                    : 'lunch-hint'.i18n(),
                                items: const [],
                                seletedItem: '',
                                onChanged: (value) {}),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            TimeOfDay? hour = await showTimePicker(
                              context: context,
                              initialTime:
                                  const TimeOfDay(hour: 15, minute: 00),
                            );
                            setState(() {
                              afternoonSnacks = hour;
                            });
                          },
                          child: AbsorbPointer(
                            child: PetcetDropdownButton(
                                hintText: afternoonSnacks != null
                                    ? afternoonSnacks!.format(context)
                                    : 'afternoonsnack-hint'.i18n(),
                                items: const [],
                                seletedItem: '',
                                onChanged: (value) {}),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            TimeOfDay? hour = await showTimePicker(
                              context: context,
                              initialTime:
                                  const TimeOfDay(hour: 18, minute: 00),
                            );
                            setState(() {
                              dinners = hour;
                            });
                          },
                          child: AbsorbPointer(
                            child: PetcetDropdownButton(
                                hintText: dinners != null
                                    ? dinners!.format(context)
                                    : 'dinner-hint'.i18n(),
                                items: const [],
                                seletedItem: '',
                                onChanged: (value) {}),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            TimeOfDay? hour = await showTimePicker(
                              context: context,
                              initialTime:
                                  const TimeOfDay(hour: 21, minute: 00),
                            );
                            setState(() {
                              suppers = hour;
                            });
                          },
                          child: AbsorbPointer(
                            child: PetcetDropdownButton(
                                hintText: suppers != null
                                    ? suppers!.format(context)
                                    : 'supper-hint'.i18n(),
                                items: const [],
                                seletedItem: '',
                                onChanged: (value) {}),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: PetctElevatedButton(
                          onPressed: () {
                            if (breakfasts != null &&
                                morningSnacks != null &&
                                lunchs != null &&
                                afternoonSnacks != null &&
                                dinners != null &&
                                suppers != null) {
                              cubit.examSettings = cubit.examSettings.copyWith(
                                breakfastsHour: breakfasts,
                                morningSnacksHour: morningSnacks,
                                lunchsHour: lunchs,
                                afternoonSnacksHour: afternoonSnacks,
                                dinnersHour: dinners,
                                suppersHour: suppers,
                              );
                              cubit.setExamSettings();
                            }
                          },
                          child: const Text('Pronto'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
