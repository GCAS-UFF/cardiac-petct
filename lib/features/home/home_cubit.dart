import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cardiac_petct/src/ui/petct_done_meal_card.dart';
import 'package:cardiac_petct/src/ui/petct_late_meal_card.dart';
import 'package:cardiac_petct/src/ui/petct_waiting_meal_card.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/domain/entities/menu.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:cardiac_petct/features/home/data/models/meal_type_model.dart';
import 'package:cardiac_petct/features/home/domain/usecases/get_menu_list.dart';
import 'package:cardiac_petct/features/home/domain/usecases/get_meal_types.dart';
import 'package:cardiac_petct/features/exam_settings/domain/usecases/get_exam_settings.dart';
import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetMenuListUsecase getMenuListUsecase;
  final GetMealTypes getMealTypes;
  final GetExamSettingsUsecase getExamSettingsUsecase;
  HomeCubit(
      this.getMenuListUsecase, this.getMealTypes, this.getExamSettingsUsecase)
      : super(HomeLoadingState());

  late List<MealType> mealTypes;
  late ExamSettingsEntity examSettingsEntity;

  void initialize() async {
    final dietDaysResponse = await getMenuListUsecase.getMenu();
    final mealTypesResponse = await getMealTypes();
    final examSettingsResponse = await getExamSettingsUsecase();
    mealTypesResponse.fold((l) => emit(HomeErrorState()),
        (mealTypesList) => mealTypes = mealTypesList);
    mealTypes.sort(MealTypeExtension.customCompare);
    examSettingsResponse.fold((l) => emit(HomeErrorState()), (examSettings) {
      examSettingsEntity = examSettings;
    });
    dietDaysResponse.fold((l) => emit(HomeErrorState()), (list) {
      final dietDays = setDateToDietDays(list);
      emit(HomeSuccessState(dietDays, mealTypes, examSettingsEntity));
    });
  }

  List<Menu> setDateToDietDays(List<Menu> dietDays) {
    for (int i = 0; i < dietDays[0].durationInDays; i++) {
      dietDays[i] = dietDays[i].copyWith(
          dietDay: examSettingsEntity.examDateTime
              .subtract(Duration(days: dietDays[0].durationInDays - i)));
    }
    return dietDays;
  }

  Widget chooseMealCard(Meal meal, String dayId, bool isLate) {
    if (meal.isRegistered) {
      return PetctDoneMealCard(
        meal: meal,
        mealType: meal.type!,
        menuId: dayId,
      );
    }
    if (isLate) {
      return PetctLateMealCard(
        meal: meal,
        mealType: meal.type!,
        menuId: dayId,
      );
    }
    return PetctWaitingMealCard(
      meal: meal,
      mealType: meal.type!,
      menuId: dayId,
    );
  }

  bool isLate(Menu day) {
    return DateTime(
                day.dietDay!.year,
                day.dietDay!.month,
                day.dietDay!.day,
                examSettingsEntity.breakfastsHour.hour,
                examSettingsEntity.breakfastsHour.minute)
            .compareTo(DateTime.now()) <
        0;
  }
}

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Menu> menu;
  final List<MealType> mealTypes;
  final ExamSettingsEntity examSettings;
  HomeSuccessState(this.menu, this.mealTypes, this.examSettings);
}

class HomeErrorState extends HomeState {}
