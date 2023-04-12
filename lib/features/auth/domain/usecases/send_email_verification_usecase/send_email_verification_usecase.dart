import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SendEmailVerificationUsecase {
  Future<Either<Failure,void>> call();
}
