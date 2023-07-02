import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/domain/usecases/registrate_meal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealRegistrationCubit extends Cubit<MealRegistrationState> {
  final RegistrateMealUsecase registrateMealUsecase;
  MealRegistrationCubit(this.registrateMealUsecase)
      : super(MealRegistrationSuccessState());

  void registrateMeal(String menuId, Meal meal, String? comment) async {
    final response = await registrateMealUsecase(menuId, meal, comment);
    response.fold(
        (error) => emit(
              MealRegistrationErrorState(),
            ),
        (success) => emit(MealRegistrationEditedState()));
  }
}

abstract class MealRegistrationState {}

class MealRegistrationLoadingState extends MealRegistrationState {}

class MealRegistrationSuccessState extends MealRegistrationState {}

class MealRegistrationEditedState extends MealRegistrationState {}

class MealRegistrationErrorState extends MealRegistrationState {}
