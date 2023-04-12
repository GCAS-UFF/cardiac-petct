import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ConfirmEmailVerifiedUsecase {
  Future<Either<Failure, bool>> call();
}
