import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:cardiac_petct/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetMealTypes {
  Future<Either<Exception, List<MealType>>> call();
}

class GetMealTypesImp implements GetMealTypes {
  final HomeRepository repository;

  GetMealTypesImp(this.repository);

  @override
  Future<Either<Exception, List<MealType>>> call() async {
    return await repository.getMealTypes();
  }
}
