import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/data/datasources/meal_local_datasource.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/domain/repositories/meal_repository.dart';
import 'package:dartz/dartz.dart';

class MealRepositoryImp implements MealRepository {
  final MealLocalDatasource localDatasource;

  MealRepositoryImp(this.localDatasource);

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
}
