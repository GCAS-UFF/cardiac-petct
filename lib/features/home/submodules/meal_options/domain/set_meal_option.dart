import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/domain/repositories/meal_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SetMealOptionUsecase {
  Future<Either<Exception, void>> call(String menuId, Meal meal);
}

class SetMealOptionUsecaseImp implements SetMealOptionUsecase {
  final MealRepository repository;

  SetMealOptionUsecaseImp(this.repository);

  @override
  Future<Either<Exception, void>> call(String menuId, Meal meal) async {
    return await repository.setMealOption(menuId, meal);
  }
}
