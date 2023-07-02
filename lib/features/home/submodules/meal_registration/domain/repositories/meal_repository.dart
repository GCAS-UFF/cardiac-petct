import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:dartz/dartz.dart';

abstract class MealRepository {
  Future<Either<Exception, void>> registrateMeal(
      String menuId, Meal meal, String? comment);
}
