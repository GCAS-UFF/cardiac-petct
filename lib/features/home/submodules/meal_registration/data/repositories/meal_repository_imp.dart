import 'package:cardiac_petct/features/home/data/datasources/home_local_datasource.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/data/datasources/meal_local_datasource.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/domain/repositories/meal_repository.dart';
import 'package:dartz/dartz.dart';

class MealRepositoryImp implements MealRepository {
  final MealLocalDatasource localDatasource;
  final HomeLocalDatasource homeLocalDatasource;

  MealRepositoryImp(this.localDatasource, this.homeLocalDatasource);

  @override
  Future<Either<Exception, void>> registrateMeal(
      String menuId, Meal meal, String? comment) async {
    try {
      final response =
          await localDatasource.registrateMeal(menuId, meal, comment);
      return Right(response);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, void>> setMealOption(
      String menuId, Meal meal) async {
    try {
      final response = await localDatasource.setMealOption(menuId, meal);
      return Right(response);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, List<Meal>>> getMealOptions(
      MealTypeEnum type) async {
    try {
      final menu = await homeLocalDatasource.getCachedMenu();
      List<Meal> mealOptions = [];
      menu!.meals!.map((meal) {
        if (meal.type!.mealType == type) {
          mealOptions.add(meal);
        }
      }).toList();
      return Right(mealOptions);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
