import 'package:cardiac_petct/features/home/domain/entities/menu.dart';
import 'package:cardiac_petct/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetMenuListUsecase {
  Future<Either<Exception, Menu>> getMenu();
}

class GetMenuUsecaseImp implements GetMenuListUsecase {
  final HomeRepository repository;

  GetMenuUsecaseImp(this.repository);

  @override
  Future<Either<Exception, Menu>> getMenu() async {
    return await repository.getMenu();
  }
}
