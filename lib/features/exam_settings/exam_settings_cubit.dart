import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';
import 'package:cardiac_petct/features/exam_settings/domain/usecases/set_exam_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamSettingsCubit extends Cubit<ExamSettingsState> {
  final SetExamSettingsUsecase setExamSettingsUsecase;
  ExamSettingsCubit(this.setExamSettingsUsecase)
      : super(ExamSettingsLoadingState());

  ExamSettingsEntity examSettings = ExamSettingsEntity(
    examHour: TimeOfDay.now(),
    examDateTime: DateTime.now(),
    examAddress: '',
    breakfastsHour: TimeOfDay.now(),
    morningSnacksHour: TimeOfDay.now(),
    lunchsHour: TimeOfDay.now(),
    afternoonSnacksHour: TimeOfDay.now(),
    dinnersHour: TimeOfDay.now(),
    suppersHour: TimeOfDay.now(),
  );

  void setExamSettings() async {
    final response = await setExamSettingsUsecase(examSettings);
    response.fold((l) => emit(ExamSettingsErrorState()),
        (r) => emit(ExamSettingsSavedState()));
  }
}

abstract class ExamSettingsState {}

class ExamSettingsLoadingState extends ExamSettingsState {}

class ExamSettingsSuccessState extends ExamSettingsState {}

class ExamSettingsErrorState extends ExamSettingsState {}

class ExamSettingsSavedState extends ExamSettingsState {}
