import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/domain/repositories/meal_repository.dart';
import 'package:dartz/dartz.dart';

abstract class RegistrateMealUsecase {
  Future<Either<Exception, void>> call(String menuId, Meal meal);
}

class RegistrateMealUsecaseImp implements RegistrateMealUsecase {
  final MealRepository repository;

  RegistrateMealUsecaseImp(this.repository);

  @override
  Future<Either<Exception, void>> call(String menuId, Meal meal) async {
    return await repository.registrateMeal(menuId, meal);
  }
}
