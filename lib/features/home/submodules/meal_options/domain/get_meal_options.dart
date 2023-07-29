import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/domain/repositories/meal_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetMealOptionsUsecase {
  Future<Either<Exception, List<Meal>>> call(MealTypeEnum type);
}

class GetMealOptionsUsecaseImp implements GetMealOptionsUsecase {
  final MealRepository repository;

  GetMealOptionsUsecaseImp(this.repository);

  @override
  Future<Either<Exception, List<Meal>>> call(MealTypeEnum type) async {
    return await repository.getMealOptions(type);
  }
}
