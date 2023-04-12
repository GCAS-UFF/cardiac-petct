import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:cardiac_petct/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> confirmEmailVerified();

  Future<void> login(String email, String password);

  Future<void> recoverPassword();

  Future<Either<Failure, void>> registration(
      UserEntity userEntity, String password);

  Future<Either<Failure, void>> sendEmailVerification();

  Future<void> signout();
}
