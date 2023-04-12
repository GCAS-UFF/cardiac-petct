import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LoginUseCase {
  Future<Either<Failure, void>> call(String email, String password);
}
