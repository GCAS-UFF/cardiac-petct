import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:dartz/dartz.dart';

abstract class MealRepository {
  Future<Either<Exception, void>> registrateMeal(
      String menuId, Meal meal, String? comment);

  Future<Either<Exception, void>> setMealOption(String menuId, Meal meal);

  Future<Either<Exception, List<Meal>>> getMealOptions(MealTypeEnum type);
}
