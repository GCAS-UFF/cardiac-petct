import 'package:cardiac_petct/features/exam_settings/exam_settings_cubit.dart';
import 'package:cardiac_petct/src/ui/petct_dropdown_button.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_text_form_field.dart';
import 'package:cardiac_petct/src/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class ExamSettingsPage extends StatefulWidget {
  const ExamSettingsPage({super.key});

  @override
  State<ExamSettingsPage> createState() => _ExamSettingsPageState();
}

class _ExamSettingsPageState extends State<ExamSettingsPage> {
  final ExamSettingsCubit cubit = Modular.get();
  final TextEditingController localController = TextEditingController();
  DateTime? examDate;
  TimeOfDay? examHour;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('about-exam-title'.i18n(),
              style: Theme.of(context).textTheme.titleLarge!),
          Text('fill-info-exam-text'.i18n(),
              style: Theme.of(context).textTheme.titleMedium!),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 22, bottom: 16, top: 22),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: Text(
                    'exam-date-hour-title'.i18n(),
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
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        currentDate: examDate,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 360),
                        ),
                      );
                      setState(() {
                        examDate = date;
                      });
                    },
                    child: AbsorbPointer(
                      child: PetcetDropdownButton(
                          hintText: examDate != null
                              ? DateFormatter.dateFormat(examDate!)
                              : 'date-hint'.i18n(),
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
                        initialTime: TimeOfDay.now(),
                      );
                      setState(() {
                        examHour = hour;
                      });
                    },
                    child: AbsorbPointer(
                      child: PetcetDropdownButton(
                          hintText: examHour != null
                              ? examHour!.format(context)
                              : 'hour-hint'.i18n(),
                          items: const [],
                          seletedItem: '',
                          onChanged: (value) {}),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 22, bottom: 16, top: 22),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: Text(
                    'exam-address'.i18n(),
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
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: PetctTextFormField(
                      hintText: 'local-hint'.i18n(),
                      controller: localController,
                      onChanged: (value) {}),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: PetctElevatedButton(
                    onPressed: () {
                      if (examDate != null &&
                          examHour != null &&
                          localController.text.isNotEmpty) {
                        cubit.examSettings = cubit.examSettings.copyWith(
                            examDateTime: examDate,
                            examHour: examHour,
                            examAddress: localController.text);
                        Modular.to.pushNamed('/meals-time');
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('next-label'.i18n()),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
