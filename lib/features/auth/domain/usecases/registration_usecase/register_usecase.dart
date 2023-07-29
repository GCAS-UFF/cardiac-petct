import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:cardiac_petct/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RegistrationUsecase {
  Future<Either<Failure, void>> call(UserEntity userEntity, String password);
}
