import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:cardiac_petct/features/home/domain/entities/menu.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Exception, List<Menu>>> getMenu();
  Future<Either<Exception, List<MealType>>> getMealTypes();
}
