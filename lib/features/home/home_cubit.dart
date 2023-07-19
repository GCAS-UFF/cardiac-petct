import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';
import 'package:cardiac_petct/features/exam_settings/domain/usecases/get_exam_settings.dart';
import 'package:cardiac_petct/features/home/data/models/meal_type_model.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:cardiac_petct/features/home/domain/entities/menu.dart';
import 'package:cardiac_petct/features/home/domain/usecases/get_meal_types.dart';
import 'package:cardiac_petct/features/home/domain/usecases/get_menu_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      final dietDays = getNormalizedDietDays(list);
      emit(HomeSuccessState(dietDays, mealTypes, examSettingsEntity));
    });
  }

  List<Menu> getNormalizedDietDays(List<Menu> dietDays) {
    for (int i = 0; i < dietDays[0].durationInDays; i++) {
      dietDays[i] = dietDays[i].copyWith(
          dietDay: examSettingsEntity.examDateTime
              .subtract(Duration(days: dietDays[0].durationInDays - i)));
    }
    return dietDays;
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
