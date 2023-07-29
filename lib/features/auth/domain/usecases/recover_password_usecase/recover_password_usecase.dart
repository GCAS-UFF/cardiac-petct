import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class RecoverPasswordUsecase {
  Future<Either<Failure, void>> call(String email);
}
