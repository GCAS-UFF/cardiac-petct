import 'package:cardiac_petct/features/home/domain/entities/menu.dart';
import 'package:cardiac_petct/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetMenuListUsecase {
  Future<Either<Exception, List<Menu>>> getMenuList();
}

class GetMenuUsecaseImp implements GetMenuListUsecase {
  final HomeRepository repository;

  GetMenuUsecaseImp(this.repository);

  @override
  Future<Either<Exception, List<Menu>>> getMenuList() async {
    return await repository.getMenuList();
  }
}
