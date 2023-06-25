import 'package:cardiac_petct/features/home/data/datasources/home_datasource.dart';
import 'package:cardiac_petct/features/home/domain/entities/menu.dart';
import 'package:cardiac_petct/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeDatasource datasource;

  HomeRepositoryImp(this.datasource);

  @override
  Future<Either<Exception, List<Menu>>> getMenuList() async {
    try {
      final response = await datasource.getMenuList();
      return Right(response);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
