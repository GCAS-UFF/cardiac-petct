import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:cardiac_petct/features/home/submodules/meal_options/domain/get_meal_options.dart';
import 'package:cardiac_petct/features/home/submodules/meal_options/domain/set_meal_option.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealOptionsCubit extends Cubit<MealOptionsState> {
  final SetMealOptionUsecase setMealOptionUsecase;
  final GetMealOptionsUsecase getMealOptionsUsecase;
  MealOptionsCubit(this.setMealOptionUsecase, this.getMealOptionsUsecase)
      : super(MealOptionsLoadingState());

  void initialize(MealTypeEnum type) async {
    final response = await getMealOptionsUsecase(type);
    response.fold((l) => emit(MealOptionsErrorState()), (options) {
      emit(MealOptionsSuccessState(options));
    });
  }

  void setMealOption(String menuId, Meal meal) async {
    final response = await setMealOptionUsecase(menuId, meal);
    response.fold((l) => emit(MealOptionsErrorState()), (r) {
      emit(MealOptionsEditedState());
    });
  }
}

abstract class MealOptionsState {}

class MealOptionsSuccessState extends MealOptionsState {
  final List<Meal> options;

  MealOptionsSuccessState(this.options);
}

class MealOptionsEditedState extends MealOptionsState {}

class MealOptionsErrorState extends MealOptionsState {}

class MealOptionsLoadingState extends MealOptionsState {}
