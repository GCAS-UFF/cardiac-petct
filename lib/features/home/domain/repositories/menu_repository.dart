import 'package:cardiac_petct/features/home/domain/entities/menu.dart';
import 'package:dartz/dartz.dart';

abstract class MenuRepository {
  Future<Either<Exception, List<Menu>>> getMenuList();
  Future<Either<Exception, void>> createMenu(Menu menu);
  Future<Either<Exception, void>> editMenu(Menu menu);
}
